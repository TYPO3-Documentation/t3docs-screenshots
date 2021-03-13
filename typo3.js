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

  // Set size of "browser window" - cannot click outside this area.
  await page.setViewport(settings.viewPort);
  loadMapping('pages');
  try {
    const config = require(getSuitePath());
    if (typeof config['settings'] === 'object') {
      settings = Object.assign(settings, config['settings']);
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

async function goToTypo3Backend(page) {
  await page.goto(settings.baseUrl + '/typo3/login', {waitUntil: 'networkidle2'});
  await page.waitForSelector('#loginCopyright');
/*
  // Screenshot: Login page of Backend
  await page.screenshot({path: 'Screenshots/01_BE_Fullpage.png', fullPage: true});

  // Screenshot: Login box of Backend
  // await page.waitForTimeout(250);
  const loginBox = await page.$('div.card.card-lg.card-login');
  await loginBox.screenshot({path: 'Screenshots/02_card-login.png'});

  // Screenshot: Login box with 25px space around
  const loginBoxBounds = await loginBox.boundingBox();
  await loginBox.screenshot({
    path: 'Screenshots/03_card_login_plus25.png',
    clip: {
      x: loginBoxBounds.x - 25,
      y: loginBoxBounds.y - 25,
      width: loginBoxBounds.width + 25 * 2,
      height: loginBoxBounds.height + 25 * 2
    }
  });

  // Screenshot: Filled login box
  const loginForm = await page.$('.typo3-login-form');

 */
  const loginFormSubmitButton = await page.$('#t3-login-submit');

  await page.type('#t3-username', 'pptr_admin');
  await page.type('#t3-password', 'pptr_admin');
 // await loginForm.screenshot({path: 'Screenshots/04_login_form.png'});
/*
  // Screenshot: Filled login box with 25px space around
  const loginFormBounds = await loginForm.boundingBox();
  await loginForm.screenshot({
    path: 'Screenshots/05_login_form_plus50.png',
    clip: {
      x: loginFormBounds.x - 50,
      y: loginFormBounds.y - 50,
      width: loginFormBounds.width + 50 * 2,
      height: loginFormBounds.height + 50 * 2
    }
  });
*/
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

    let tableConfig = config['extensions'][key]['tables'];
    for (let i = 0; i < tableConfig.length; i++) {
      try {
        await processTable(tableConfig[i], extensionSettings, page, firstLine);
      } catch(e) {
        log(
          'Something went wrong processing table ' + tableConfig[i]['table'],
          'error', e);
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
      await processFieldScreenshot(
        fieldSettings, page, tableName, viewConfig, firstLine);
      processFieldSnippet(
        firstLine, extensionSettings, fieldSettings, tableName, viewConfig);
    }
  }
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
        await processTableView(viewConfig, tableName, page, viewSettings, firstLine);
        await processRecordView(viewConfig, tableName, page, viewSettings, firstLine);
        await processFieldsView(viewConfig, tableConfig, tableName, prefix, extensionSettings, page, firstLine);
      } catch(e) {
        log(
          'Something went wrong processing view "' + viewConfig['view'] +
          '" of table "' + tableName + '"',
          'error', e);
      }
    }
  }
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
    fieldSettings['actions'], fieldSettings['clip']);
}

async function createTableScreenshot(page, table, pid, viewSettings) {
  let command = 'table=' + table;
  let bePath = 'module/web/list';
  await createScreenshot(
    page, table, pid, viewSettings['absoluteImageFilename'],
    viewSettings['selector'], command, bePath, viewSettings['actions'], viewSettings['clip']);
}

async function createRecordScreenshot(page, table, uid,viewSettings) {
  let command = 'edit[' + table + '][' + uid + ']=edit';
  let bePath = 'record/edit';
  await createScreenshot(
    page, table, uid, viewSettings['absoluteImageFilename'],
    viewSettings['selector'], command, bePath, viewSettings['actions'], viewSettings['clip']);
}

async function createScreenshot(page, table, uid, path, selector, command, bePath, actions, clip) {
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
      if (action['item'] === 'box') {
        $(action['selector']).css(
          {
            "border-color":"#F49700",
            "border-width":"2px",
            "border-radius":"2px"
          });
      }
      if (action['item'] === 'arrow') {
        const element = $(action['selector']);
        element.prepend('' +
          '<img id="t3docsArrow" ' +
          ' src="/fileadmin/images/icon-collections/primary-orange-design-team/icons/arrow.svg" ' +
          ' style="' +
          '    position: absolute;' +
          '    z-index: 1000;' +
          '    top: -40px;' +
          '    left: '+element.width()+'px;' +
          '    transform: rotate(-20deg);' +
          '"/>')
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
      }
    }
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
    const selector = "select[name=\"data[" + table + "][" +
      uid + "][" + actions[i]['select'] + "]\"]";
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
