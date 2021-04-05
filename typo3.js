const puppeteer = require('puppeteer');
const fs = require('fs');
const minimist = require('minimist');

// *************************************
// Configuration
// *************************************
var settings = {
  baseUrl: 'http://localhost',
  suite: 'TYPO3CMS-Reference-TCA',
  viewPort: {
    width: 640,
    height: 640
  },
  errorPath: 'public/Output/Errors/',
  mappingsPath: './public/Output/json/',
  limitToTable: '',
  limitToImage: '',
  limitToExtension: '',
  stopOnFirstError: true,
  standardTimeoutTime: 500,
  snippet: 'include',
  isTca: true
};
let mappings = {
};

// *************************************
// Main process
function loadMapping(table) {
  if (typeof mappings[table] !== 'object') {
    try {
      mappings[table] = require(settings.mappingsPath + table + '.json');
    } catch (e) {
      mappings[table] = [];
    }
  }
}

// *************************************
(async () => {
  fetchSettingsFromCli();

  const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
  const page = await browser.newPage();
  page.on('console', consoleObj => console.log(consoleObj.text()));

  // Set size of "browser window" - cannot click outside this area.
  await page.setViewport(settings.viewPort);
  loadMapping('pages');
  try {
    const config = require(getSuitePath());
    if (typeof config['settings'] === 'object') {
      settings = Object.assign(settings, config['settings']);
    }
    try {
      let dir = settings.errorPath;
      if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, {recursive: true});
      }
    } catch (e) {
      log('Error creating error path.', 'error', e);
    }
    try {
      await goToTypo3Frontend(page, config);
    } catch (e) {
      log('TYPO3 Frontend doesn\'t work', 'error', e);
    }
    try {
      await goToTypo3Backend(page, config);
      await processBackendSuite(page, config);
    } catch (e) {
      log('TYPO3 Backend doesn\'t work', 'error', e);
    }
  } catch(e) {
    if (settings['stopOnFirstError']) {
      process.exit(1);
    }
  }

  await browser.close();
})()

// *************************************
// Library
// *************************************
function fetchSettingsFromCli() {
  const args = minimist(process.argv.slice(2))
  if (args['suite']) {
    settings.suite = args['suite'];
  }
  if (args['limitToTable']) {
    settings.limitToTable = args['limitToTable'];
  }
  if (args['limitToImage']) {
    settings.limitToImage = args['limitToImage'];
  }
  if (args['limitToExtension']) {
    settings.limitToExtension = args['limitToExtension'];
  }
  if (args['stopOnFirstError']) {
    settings.stopOnFirstError = args['stopOnFirstError'] === 'true';
  }
}

async function goToTypo3Frontend(page) {
  await page.goto(settings.baseUrl);
  await page.waitForSelector('body');

  // Screenshot: Frontend page
  await page.screenshot({path: 'Screenshots/00_FE_Fullpage.png', fullPage: true});
}

async function takeLoginScreenshot(page, config) {
  // Take a Screenshot of the backend login
  console.log("login screen");
  for (let key in config['extensions']) {
    let extensionConfig = config['extensions'][key];
    let extensionSettings = getExtensionSettings(extensionConfig);
    if (typeof extensionConfig['login'] === 'object') {
      for (let i = 0; i < extensionConfig['login'].length; i++) {
        let loginConfig = extensionConfig['login'][i];
        if (typeof loginConfig['screens'] === 'object') {
          for (let j = 0; j < loginConfig['screens'].length; j++) {
            let viewConfig = loginConfig['screens'][j];
            let viewSettings = getModuleViewSettings(viewConfig, extensionSettings);
            let path = viewSettings['absoluteImageFilename'];
            console.log('Capturing: ' + path);
            if (viewSettings['type'] === 'fullpage') {
              // Screenshot: Full page of Backend
              await page.screenshot({
                path: path,
                fullPage: true
              });
            } else if (viewSettings['type'] === 'boundingbox') {
              // Screenshot: Add + 25px space around Login-Box
              const loginWrap = await page.$('.card-login');
              const loginWrapBounds = await loginWrap.boundingBox();
              await loginWrap.screenshot({
                path: path,
                clip: {
                  x: loginWrapBounds.x - 25,
                  y: loginWrapBounds.y - 25,
                  width: loginWrapBounds.width + 25 * 2,
                  height: loginWrapBounds.height + 25 * 2
                }
              });
            } else {
              // Screenshot: Login-Box
              const loginWrap = await page.$('.card-login');
              await loginWrap.screenshot({
                path: path,
              });
            }
          }
        }
      }
    }
  }
}

async function goToTypo3Backend(page, config) {
  await page.goto(settings.baseUrl + '/typo3/login', {waitUntil: 'networkidle2'});
  await page.waitForSelector('#loginCopyright');

  await takeLoginScreenshot(page, config);

  const loginFormSubmitButton = await page.$('#t3-login-submit');

  await page.type('#t3-username', 'pptr_admin');
  await page.type('#t3-password', 'pptr_admin');
  await loginFormSubmitButton.click();
  await page.waitForNavigation();
}

function log(str, severity='debug', e = null) {
  console.log(str);
  if (e) {
    log(e);
    if (settings['stopOnFirstError']) {
      process.exit(1);
    }
  }
}

function getExtensionSettings(extensionConfig) {
  let outputPathConfig = {
    'absoluteImagePath': getOutputPath() + extensionConfig['paths']['imageSource'],
    'imageIncludesPath': getOutputPath() + extensionConfig['paths']['imageRst'],
  };
  if (typeof extensionConfig['paths']['codeRst'] === 'string') {
    outputPathConfig['snippetsIncludePath'] =
      getOutputPath() + extensionConfig['paths']['codeRst'];
  }
  for (const outputPathKey in outputPathConfig) {
    const dir = outputPathConfig[outputPathKey];
    if (typeof dir !== 'string') {
      log(outputPathKey + ' contains no string!');
    } else if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, {recursive: true});
    }
  }
  let extensionSettings = Object.assign(extensionConfig, outputPathConfig);
  extensionSettings['relativeImagePath'] = extensionSettings['paths']['relativeImagePath'];
  extensionSettings['relativeCodeSource'] = extensionSettings['paths']['relativeCodeSource'];
  return extensionSettings;
}

async function processBackendSuite(page, config) {

  const firstLine = config['comments']['rst.txt'] + "\r\n";

  for (let key in config['extensions']) {
    let extensionConfig = config['extensions'][key];
    let extensionSettings = getExtensionSettings(extensionConfig);
    if (settings.limitToExtension === '' ||
        settings.limitToExtension === config['extensions'][key]['extension']) {
      let overviewConfig = config['extensions'][key]['overview'];
      await overviewScreenshots(overviewConfig, extensionSettings, page, firstLine);

      let moduleConfig = config['extensions'][key]['modules'];
      await moduleScreenshots(moduleConfig, extensionSettings, page, firstLine);

      let tableConfig = config['extensions'][key]['tables'];
      if (typeof tableConfig === 'object') {
        for (let i = 0; i < tableConfig.length; i++) {
          try {
            await processTable(tableConfig[i], extensionSettings, page, firstLine);
          } catch (e) {
            log(
              'Something went wrong processing table ' + tableConfig[i]['table'],
              'error', e);
          }
        }
      }
    }
  }
}

function getViewSettings(viewConfig, prefix, tableName, extensionSettings) {
  let name = getString(viewConfig['filename']);
  let filename = name ? name : getCamelCase(prefix + tableName);

  let viewSettings = Object.assign(viewConfig,
    {
      'caption': getString(viewConfig['caption']),
      'name': name,
      'filename': filename,
      'selector': getString(viewConfig['selector']),
      'actions': getArray(viewConfig['actions']),
      'prefix': prefix,
      'includeRstFilename': extensionSettings['imageIncludesPath'] + filename + '.rst.txt',
      'absoluteImageFilename': extensionSettings['absoluteImagePath'] + filename + '.png',
      'relativeImageFilename': extensionSettings['relativeImagePath'] + filename + '.png'
    }
  );
  return viewSettings;
}

async function processTableView(viewConfig, tableName, page, viewSettings, firstLine) {
  if (viewConfig['view'] === 'table') {
    let pid = getUid(viewConfig['selectRecord'], 'pages', viewConfig['pid']);
    log('Take Screenshot from table ' + tableName + ' of page ' + pid);
    await createTableScreenshot(page, tableName, pid, viewSettings);
    createImageIncludeRst(viewSettings, firstLine, tableName, '');
  }
}

function getUid(selectRecord, tableName, id) {
  let ret = id;
  let map = mappings[tableName];
  if (typeof map === 'object') {
    if (ret === 0 && tableName === 'pages') {

    } else if (typeof ret !== "undefined" && ret > 0) {
      let found = false;
      for (let i = 0; i < map.length; i++) {
        if (ret === map[i]['uid']) {
          found = 1;
        }
      }
      if (!found) {
        throw new Error("Record with uid " + id + " not found in table "+tableName);
      }
    } else {
      let map = mappings[tableName];
      if (typeof selectRecord === 'object') {
        let by = selectRecord['by'];
        if (by.startsWith("@")) {
          switch (by) {
            case "@first":
              if (map.length > 0) {
                ret = map[0]['uid'];
              }
              break;
            default:
              throw new Error("Select by " + by + " not defined");
          }
        } else {
          let value = selectRecord[by];
          if (typeof value == "object") {
            value = getUid(value, value['table'], 0);
          }
          for (let i = 0; i < map.length; i++) {
            if (map[i][by] === value) {
              ret = map[i]['uid'];
              break;
            }
          }
        }
      }
    }
  }
  if (typeof ret === "undefined" || ret < 0) {
    throw new Error("Record of table " + tableName + " with selector " + JSON.stringify(selectRecord) + " not found");
  }
  return ret;
}

async function processRecordView(viewConfig, tableName, page, viewSettings, firstLine) {
  if (viewConfig['view'] === 'record' && viewConfig['screenshot'] !== 'ignore') {
    let uid = getUid(viewConfig['selectRecord'], tableName, viewConfig['uid']);
    await createRecordScreenshot(page, tableName, uid, viewSettings);
    createImageIncludeRst(viewSettings, firstLine, tableName, '');
  }
}

function getFieldSettings(viewConfig, fieldConfig, tableName, prefix, extensionSettings) {
  let fieldname = '';
  if (typeof fieldConfig == 'string') {
    fieldname = fieldConfig;
  } else {
    fieldname = fieldConfig['field'];
  }
  let fieldSettings = {
    'field': fieldname,
    'screenshot': '',
    'snippet': '',
    'caption': 'Screenshot of field ' + tableName + ':' + fieldname,
    'filename': getCamelCase(prefix + fieldname),
    'actions': viewConfig['actions'],
    'prefix': viewConfig['prefix'],
  }
  if (typeof fieldConfig == 'object') {
    fieldSettings = Object.assign(fieldSettings, fieldConfig);
  }
  let filename = fieldSettings['filename'];
  fieldSettings['absoluteImageFilename'] = extensionSettings['absoluteImagePath'] + filename + '.png';
  fieldSettings['relativeImageFilename'] = extensionSettings['relativeImagePath'] + filename + '.png';
  fieldSettings['includeRstFilename'] = extensionSettings['imageIncludesPath'] + filename + '.rst.txt';
  fieldSettings['includeSnippetFilename'] = extensionSettings['snippetsIncludePath'] + filename + '.rst.txt';
  return fieldSettings;
}

async function processFieldScreenshot(fieldSettings, page, tableName, viewConfig, firstLine) {
  if (fieldSettings['screenshot'] !== 'ignore') {
    try {

      let uid = getUid(viewConfig['selectRecord'], tableName, viewConfig['uid']);
      await createFieldScreenshot(page, tableName, uid, fieldSettings);
      createImageIncludeRst(
        fieldSettings, firstLine,
        tableName, fieldSettings['field']);
    } catch (e) {
      if (fieldSettings['screenshot'] !== 'ignoreOnError') {
        log(
          'Something went wrong processing view "' + viewConfig['view'] +
          '" of table "' + tableName + '" and field "' +
          fieldSettings['field'] + '"',
          'error', e);
      }
    }
  }
}

function processFieldSnippet(firstLine, extensionSettings, fieldSettings, tableName, viewConfig) {
  if (settings['snippet'] !== 'ignore' && fieldSettings['snippet'] !== 'ignore') {
    try {
      createSnippetIncludeRst(
        firstLine, extensionSettings, fieldSettings,
        tableName, fieldSettings['field']);
    } catch (e) {
      log(
        'Something went wrong processing view "' + viewConfig['view'] +
        '" of table "' + tableName + '" and field "' +
        fieldSettings['field'] + '"',
        'error', e);
    }
  }
}

async function processFieldsView(viewConfig, tableConfig, tableName, prefix, extensionSettings, page, firstLine) {
  if (viewConfig['view'] === 'fields') {
    for (let j = 0; j < tableConfig['fields'].length; j++) {
      let fieldSettings = getFieldSettings(
        viewConfig, tableConfig['fields'][j], tableName, prefix,
        extensionSettings);

      if (settings.limitToImage === '' ||
          settings.limitToImage === fieldSettings['filename']) {
        await processFieldScreenshot(
          fieldSettings, page, tableName, viewConfig, firstLine);
        processFieldSnippet(
          firstLine, extensionSettings, fieldSettings, tableName, viewConfig);
      }
    }
  }
}

async function overviewScreenshots(overviewConfig, extensionSettings, page, firstLine) {
  console.log('Overview Screenshot List');
  if (typeof overviewConfig === 'object') {
    for (let i = 0; i < overviewConfig.length; i++) {

      let moduleSettings = getModuleSettings(overviewConfig[i], extensionSettings);
      for (let j = 0; j < overviewConfig[i]['screens'].length; j++) {
        let viewConfig = overviewConfig[i]['screens'][j];
        let viewSettings = getModuleViewSettings(viewConfig, extensionSettings);
        try {
          if (settings.limitToImage === '' || settings.limitToImage === viewSettings['filename']) {
            await createOverviewScreenshot(page, moduleSettings, viewSettings);
            createImageIncludeRst(viewSettings, firstLine, '', '');
          }
        } catch(e) {
          log(
            'Something went wrong processing the module "' + overviewConfig['module'],
            'error', e);
        }
      }
    }
  }
}

async function createOverviewScreenshot(
  page, overviewSettings, viewSettings
) {
  let filename = viewSettings['filename'];
  let selector = viewSettings['selector'];
  console.log('Overview Screenshot: '+filename);
  let url = 'http://localhost/typo3/main';
  console.log('Goto: ' + url);
  let path = viewSettings['absoluteImageFilename'];
  await page.goto(url,{waitUntil: 'networkidle2'});
  if (viewSettings['actions']) {
    console.log(viewSettings['actions']);
    await executeActions(viewSettings['actions'], page, 'module', 0);
  }
  console.log('Capturing: ' + path);
  if (typeof viewSettings['viewport'] === 'object') {
    await page.setViewport(viewSettings['viewport']);
  }
  if (selector === '') {
    // whole page screenshot
    await page.screenshot({
      path: path,
    });
  } else {
    const formSection = await page.$(selector);
    await formSection.screenshot({
      path: path,
    });
  }
  if (typeof viewSettings['viewport'] === 'object') {
    await page.setViewport(settings.viewPort);
  }
}


async function moduleScreenshots(moduleConfig, extensionSettings, page, firstLine) {
  console.log('Module Screenshot List');
  if (typeof moduleConfig === 'object') {
    for (let i = 0; i < moduleConfig.length; i++) {

      let moduleSettings = getModuleSettings(moduleConfig[i], extensionSettings);
      for (let j = 0; j < moduleConfig[i]['screens'].length; j++) {
        let viewConfig = moduleConfig[i]['screens'][j];
        let viewSettings = getModuleViewSettings(viewConfig, extensionSettings);

        try {
          if (settings.limitToImage === '' || settings.limitToImage === viewSettings['filename']) {
            await createModuleScreenshot(page, moduleSettings, viewSettings);
            createImageIncludeRst(viewSettings, firstLine, '', '');
          }
        } catch(e) {
          log(
            'Something went wrong processing the module "' + moduleConfig['module'],
            'error', e);
        }
      }
    }
  }
}


async function createModuleScreenshot(
  page, moduleSettings, viewSettings
) {
  let filename = viewSettings['filename'];
  let selector = viewSettings['selector'];
  const clip= viewSettings['clip'];
  console.log('Module Screenshot: '+filename);
  let url = 'http://localhost/typo3/index.php?route='+moduleSettings['module'];
  let parameters = '';
  let paramConfig = viewSettings['parameters'];
  if(typeof paramConfig == 'object')
    for (let j = 0; j < paramConfig.length; j++) {
      if (parameters !== '') {
        parameters += '&';
      }
      parameters += paramConfig[j]['key'] + '=' +
        paramConfig[j]['value'];
    }
  if (parameters !== '') {
    url += '&' + parameters;
  }
  url += '&token=x';
  console.log('Goto: ' + url);
  let path = viewSettings['absoluteImageFilename'];
  await page.goto(url,{waitUntil: 'networkidle2'});
  if (viewSettings['actions']) {
    console.log(viewSettings['actions']);
    await executeActions(viewSettings['actions'], page, 'module', 0);
  }
  console.log('Capturing: ' + path);
  if (typeof viewSettings['viewport'] === 'object') {
    console.log(viewSettings['viewport']);
    await page.setViewport(viewSettings['viewport']);
  }
  if (selector === '') {
    // whole page screenshot
    await page.screenshot({
      path: path,
    });
  } else {
    const formSection = await page.$(selector);
    if (typeof clip !== 'object') {
      await formSection.screenshot({
        path: path
      });
    } else {
      const formBounds = await formSection.boundingBox();
      let height = formBounds.height + formBounds.y;
      let width = formBounds.width + formBounds.x;
      if (typeof clip === 'object') {
        if (typeof clip['height'] === 'number') {
          height = clip['height'];
        }
        if (typeof clip['width'] === 'number') {
          width = clip['width'];
        }
      }
      await formSection.screenshot({
        path: path,
        clip: {
          x: 0,
          y: 0,
          width: width,
          height: height
        }
      });
    }
    await formSection.screenshot({
      path: path,
    });
  }
  if (typeof viewSettings['viewport'] === 'object') {
    await page.setViewport(settings.viewPort);
  }
}

function getModuleSettings(moduleConfig, extensionSettings) {
  let filename = getString(moduleConfig['filename']);
  let viewSettings = Object.assign(moduleConfig,
    {
      'caption': getString(moduleConfig['caption']),
      'filename': filename,
      'selector': getString(moduleConfig['selector']),
      'actions': getArray(moduleConfig['actions']),
      'includeRstFilename': extensionSettings['imageIncludesPath'] + filename + '.rst.txt',
      'absoluteImageFilename': extensionSettings['absoluteImagePath'] + filename + '.png',
      'relativeImageFilename': extensionSettings['relativeImagePath'] + filename + '.png'
    }
  );
  return viewSettings;
}

function getModuleViewSettings(viewConfig, extensionSettings) {
  let filename = getString(viewConfig['filename']);

  let viewSettings = Object.assign(viewConfig,
    {
      'caption': getString(viewConfig['caption']),
      'filename': filename,
      'selector': getString(viewConfig['selector']),
      'actions': getArray(viewConfig['actions']),
      'includeRstFilename': extensionSettings['imageIncludesPath'] + filename + '.rst.txt',
      'absoluteImageFilename': extensionSettings['absoluteImagePath'] + filename + '.png',
      'relativeImageFilename': extensionSettings['relativeImagePath'] + filename + '.png'
    }
  );
  return viewSettings;
}

async function processTable(tableConfig, extensionSettings, page, firstLine) {
  let tableName = tableConfig['table'];
  loadMapping(tableName);
  let prefix = getString(tableConfig['prefix']);
  if (!settings.limitToTable || tableName === settings.limitToTable) {
    for (let k = 0; k < tableConfig['screens'].length; k++) {
      let viewConfig = tableConfig['screens'][k];
      let viewSettings = getViewSettings(viewConfig, prefix, tableName, extensionSettings);
      try {
        if (settings.limitToImage === '' ||
            settings.limitToImage === viewSettings['filename']
            || viewConfig['view'] === 'fields') {
          await processTableView(viewConfig, tableName, page, viewSettings, firstLine);
          await processRecordView(viewConfig, tableName, page, viewSettings, firstLine);
          await processInfoView(viewConfig, tableName, page, viewSettings, firstLine);
          await processFieldsView(viewConfig, tableConfig, tableName, prefix, extensionSettings, page, firstLine);
        }
      } catch(e) {
        log(
          'Something went wrong processing view "' + viewConfig['view'] +
          '" of table "' + tableName + '"',
          'error', e);
      }
    }
  }
}

async function processInfoView(viewConfig, tableName, page, viewSettings, firstLine) {
  if (viewConfig['view'] === 'info' && viewConfig['screenshot'] !== 'ignore') {
    let uid = getUid(viewConfig['selectRecord'], tableName, viewConfig['uid']);
    await createInfoScreenshot(page, tableName, uid, viewSettings);
    createImageIncludeRst(viewSettings, firstLine, tableName, '');
  }
}


async function createInfoScreenshot(page, table, uid,viewSettings) {
  let command = 'table=' + table + '&uid=' + uid + '';
  let bePath = 'record/info';
  await createScreenshot(
    page, table, uid, viewSettings['absoluteImageFilename'],
    viewSettings['selector'], command, bePath, viewSettings);
}

function getSuitePath() {
  return './public/OriginalManual/' + settings.suite + '/Scripts/GenerateScreenshots/Config.json';
}

function getOutputPath() {
  return 'public/Output/' + settings.suite + '/';
}

function getString(value) {
  if (typeof value == 'string') {
    return value;
  }
  return '';
}

function getArray(value) {
  if (typeof value == 'object') {
    return value;
  }
  return [];
}

function getCamelCase(string) {
  var splitStr = string.toLowerCase().split('_');
  for (var k = 0; k < splitStr.length; k++) {
    splitStr[k] = splitStr[k].charAt(0).toUpperCase() + splitStr[k].substring(1);
  }
  return splitStr.join('');
}

async function createFieldScreenshot(page, table, uid, fieldSettings) {
  let command = 'edit[' + table + '][' + uid + ']=edit&columnsOnly=' +
    fieldSettings['field'];
  let bePath = 'record/edit';
  let selector = '.form-section';
  if (typeof fieldSettings['selector'] === 'string' && fieldSettings['selector'] !== '')
    selector = fieldSettings['selector'];
  await createScreenshot(page, table, uid,
    fieldSettings['absoluteImageFilename'],
    selector, command, bePath,
    fieldSettings);
}

async function createTableScreenshot(page, table, pid, viewSettings) {
  let command = 'table=' + table + "&id=" + pid;
  let bePath = 'module/web/list';
  await createScreenshot(
    page, table, pid, viewSettings['absoluteImageFilename'],
    viewSettings['selector'], command, bePath, viewSettings);
}

async function createRecordScreenshot(page, table, uid,viewSettings) {
  let command = 'edit[' + table + '][' + uid + ']=edit';
  let bePath = 'record/edit';
  await createScreenshot(
    page, table, uid, viewSettings['absoluteImageFilename'],
    viewSettings['selector'], command, bePath, viewSettings);
}

async function createScreenshot(page, table, uid, path, selector, command, bePath, viewSettings) {
  const actions = viewSettings['actions'];
  const clip= viewSettings['clip'];
  const backendUrl = settings.baseUrl + '/typo3/' + bePath + '?token=1&' + command;
  await page.goto(backendUrl, {waitUntil: 'networkidle2'});
  await page.addScriptTag({ url: 'https://code.jquery.com/jquery-3.2.1.min.js' });
  if (actions) {
    await executeActions(actions, page, table, uid);
  }
  log('Capturing: ' + path);
  log('At url: ' + backendUrl + ', Selector: ' + selector);
  if (selector === '') {
    // whole page screenshot
    await page.screenshot({
      path: path,
    });
  } else {
    const formSection = await page.$(selector);
    if (formSection) {
      if (typeof clip !== 'object') {
        await formSection.screenshot({
          path: path
        });
      } else {
        const formBounds = await formSection.boundingBox();
        let height = formBounds.height + formBounds.y;
        let width = formBounds.width + formBounds.x;
        if (typeof clip === 'object') {
          if (typeof clip['height'] === 'number') {
            height = clip['height'];
          }
          if (typeof clip['width'] === 'number') {
            width = clip['width'];
          }
        }
        await formSection.screenshot({
          path: path,
          clip: {
            x: 0,
            y: 0,
            width: width,
            height: height
          }
        });
      }
    } else {
      const errorImagePath =  settings.errorPath + getCamelCase(table + '_' + uid) + '.png';
      await page.screenshot({
        path: errorImagePath,
      });
      let errorMessage = 'Selector "' + selector + '" not found.\r\n';
      errorMessage += 'See error screenshot ' + errorImagePath + '\r\n';
      errorMessage += 'Url called: ' + backendUrl + '\r\n';
        throw new Error(errorMessage);
    }
  }
}

async function hideAction(page, action) {
  if (action['selector']) {
    await page.evaluate((action) => {
      const $ = window.$;
      $(action['selector']).hide();
    }, action);
  }
}

async function drawAction(page, action) {
  if (action['selector'] && action['item']) {
    await page.evaluate((action) => {
      const $ = window.$;
      let element = $(action['selector']);
      console.log("draw action");
      if (typeof action['iframe'] === 'string' && action['iframe'] !== '') {
        const iframe = $(action['iframe']);
        if (iframe) {
          element = iframe.contents().find(action['selector']);
        } else {
          console.log("iframe not found:" + action['iframe']);
        }
      }
      if (action['item'] === 'box') {
        element.css(
          {
            "border-style":"solid",
            "border-color":"#F49700",
            "border-width":"2px",
            "border-radius":"2px"
          });
      }
      else if (action['item'] === 'arrow') {
        element.css(
          {
            "position":"relative"
          });
        let css = '    position: absolute;' +
          '    z-index: 1000;' +
          '    top: -40px;' +
          '    left: '+element.width()+'px;' +
          '    transform: rotate(-20deg);' ;
        if (typeof action['position'] == 'string') {
          if (action['position'] === 'left') {
            css = '    position: absolute;' +
              '    z-index: 1000;' +
              '    top: -65px;' +
              '    left: -100px;' +
              '    transform: rotate(-135deg);' ;
          }
          else if (action['position'] === 'center') {
            css = '    position: absolute;' +
              '    z-index: 1000;' +
              '    top: -65px;' +
              '    left: 50%;' +
              '    transform: rotate(-45deg);' ;
          }
        }
        element.prepend('' +
          '<img id="t3docsArrow" ' +
          ' src="/fileadmin/images/icon-collections/primary-orange-design-team/icons/arrow.svg" ' +
          ' style="' +
          css +
          '"/>')
      }
      else if (action['item'] === 'label') {
        element.css(
          {
            "position":"relative"
          });
        let css = '    position: absolute;' +
          '    z-index: 1000;' +
          '    background: #F49700;' +
          '    color: black; font-size: 20px; font-weight: bold;' +
          '    height: 30px; width: 30px;' +
          '    border-radius: 5px;' +
          '    text-align:center;' +
          '    line-height:30px;' ;
        let positionCss =
          '    top: 0;' +
          '    right: 0;';
        if (typeof action['position'] == 'string') {
          if (action['position'] === 'left') {
            positionCss =
              '    top: 0;' +
              '    left: 0;';
          }
          else if (action['position'] === 'outerRight') {
            positionCss =
              '    top: 0;' +
              '    right: -30px;';
          }
        }
        css = css + positionCss;
        let innerCss = '' ;
        element.prepend('' +
          '<div id="t3docsLabel" ' +
          ' style="' +
          css +
          '"><div style="' +
          innerCss +
          '"></div>' + action['content'] + '</div></div>')
      }
    }, action);
  }
}


async function executeActions(actions, page, table, uid) {

  for (var i = 0; i < actions.length; i++) {
    let executeAction = true;
    if (typeof actions[i]['if'] === 'object') {
      for (var j = 0; j < actions[i]['if'].length; j++) {
        if (typeof actions[i]['if'][j]['exists'] === 'string') {
          let selector = actions[i]['if'][j]['exists'];
          log('if selector ' + selector);
          if (await page.$(selector) === null) {
            log('selector not found ');
            executeAction = false;
          }
        }
      }
    }
    if (executeAction) {
      if (actions[i]['action'] === 'click') {
        await clickAction(actions, i, page, table, uid);
      } else if (actions[i]['action'] === 'change') {
        await changeAction(actions, i, page, table, uid);
      } else if (actions[i]['action'] === 'wait') {
        await waitAction(actions, i, page, table, uid);
      } else if (actions[i]['action'] === 'open') {
        await openAction(actions[i], page, table, uid);
      } else if(actions[i]['action'] === 'hide') {
        await hideAction(page, actions[i]);
      } else if(actions[i]['action'] === 'draw') {
        await drawAction(page, actions[i]);
      } else if(actions[i]['action'] === 'setCss') {
        await setCssAction(page, actions[i]);
      }
    }
  }
}


async function setCssAction(page, action) {
  if (typeof action['selector'] == 'string' && typeof action['css'] == 'object') {
    await page.evaluate((action) => {
      const $ = window.$;
      $(action['selector']).css(action['css']);
    }, action);
  }
}


async function openAction(action, page, table, uid) {
  if (action['accordion']) {
    let selector = ".form-irre-header-button";
    if (action['accordion'].startsWith("@")) {
      selector = '.form-irre-header-button';
    } else {
      selector = action['accordion'];
    }
    const attr = await page.$$eval(selector,
        el => el.map(x => x.getAttribute("aria-expanded")));
    if (typeof attr === 'object' && attr.length > 0 && attr[0] !== 'true') {
      page.click(selector);
      await page.waitForTimeout(settings.standardTimeoutTime);
    }
  }
}

async function clickAction(actions, i, page, table, uid) {
  if (actions[i]['tab']) {
    const [link] = await page.$x("//a[contains(., '" + actions[i]['tab'] + "')]");
    if (link) {
      await link.click();
    } else {
      await logNotFound('Tab not found: ' + actions[i]['tab']);
    }
  } else if (actions[i]['select']) {
    let selector = 'select';
    if (typeof actions[i]['selector'] === 'string'){
      selector = actions[i]['selector'];
    } else {
      selector = "select[name=\"data[" + table + "][" +
        uid + "][" + actions[i]['select'] + "]\"]";
    }
    await page.focus(selector);
    page.keyboard.type(' ');
  } else if (actions[i]['button']) {
    const [link] = await page.$x("//button[contains(., '" + actions[i]['button'] + "')]");
    if (link) {
      await link.click();
    } else {
      await logNotFound('Button not found: ' + actions[i]['button']);
    }
  } else if (actions[i]['buttonSelector']) {
    const selector = actions[i]['buttonSelector'];
    page.click(selector);
  }
}

async function waitAction(actions, i, page, table, uid) {
  if (actions[i]['selector']) {
    await page.waitForSelector(actions[i]['selector'], actions[i]['options']);
  } else if (actions[i]['timeout']) {
    await page.waitForTimeout(actions[i]['timeout']);
  }
}

async function changeAction(actions, i, page, table, uid) {
  if (actions[i]['select']) {
    const selector = "select[name=\"data[" + table + "][" +
      uid + "][" + actions[i]['select'] + "]\"]";
    await page.select(selector, actions[i]['value']);
  }
}

function createSnippetIncludeRst(firstLine, extensionSettings, fieldSettings, table, field) {
  let includeRst =
    firstLine +
    "\r\n" +
    ".. literalinclude:: " + extensionSettings['relativeCodeSource'] + table + ".php\r\n" +
    "   :language: php\r\n" +
    "   :start-at: start " + field + "\r\n" +
    "   :end-before: end " + field + "\r\n" +
    "   :lines: 2- \r\n" +
    "\r\n";
  fs.writeFile(fieldSettings['includeSnippetFilename'], includeRst, function (err) {
    if (err) throw err;
  });
}

function createImageIncludeRst(rstSettings, firstLine, table, field = '') {
  let imageText = "Screenshot of  table " + table;
  if (field) {
    imageText = "Screenshot of  field " + field + ", table " + table;
  }
  if (rstSettings['caption']) {
    imageText = rstSettings['caption'];
  }
  let alt = imageText;
  let description = imageText;
  if (field && settings.isTca) {
    description = ":ref:`" + imageText +
      " <tca_example_" + rstSettings['prefix'] + field + ">`";
  }
  // Create the file for including the Screenshots
  let rstFileContent =
    firstLine +
    "\r\n" +
    ".. figure:: " + rstSettings['relativeImageFilename'] + "\r\n" +
    "   :alt: " + alt + "\r\n" +
    "   :class: with-shadow\r\n" +
    "\r\n" +
    "   " + description + "\r\n"
  fs.writeFile(rstSettings['includeRstFilename'], rstFileContent, function (err) {
    if (err) throw err;
  });
}

async function logNotFound(text) {
  log('########################################');
  log('## ' + text);
  log('########################################');
}
