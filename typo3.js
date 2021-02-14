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
    limitToTable: ''
};

// *************************************
// Main process
// *************************************
(async () => {
    fetchSettingsFromCli();

    const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    const page = await browser.newPage();

    // Set size of "browser window" - cannot click outside this area.
    await page.setViewport(settings.viewPort);

    await goToTypo3Frontend(page);
    await goToTypo3Backend(page);
    await processSuite(page);

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
    const loginFormSubmitButton = await page.$('#t3-login-submit');
    await page.type('#t3-username', 'pptr_admin');
    await page.type('#t3-password', 'pptr_admin');
    await loginForm.screenshot({path: 'Screenshots/04_login_form.png'});

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

    await loginFormSubmitButton.click();
    await page.waitForNavigation();
}

async function processSuite(page) {
    const config = require(getSuitePath());

    const firstLine = config['comments']['rst.txt'] + "\r\n";

    for(let key in config['extensions']){
        let extensionConfig = config['extensions'][key];

        let absoluteImagePath = getOutputPath() + extensionConfig['paths']['imageSource'];
        let relativeImagePath = extensionConfig['paths']['relativeImagePath'];
        let imageIncludesPath = getOutputPath() + extensionConfig['paths']['imageRst'];
        let snippetsIncludePath = getOutputPath() + extensionConfig['paths']['codeRst'];
        let relativeCodeSource = extensionConfig['paths']['relativeCodeSource'];

        if (!fs.existsSync(absoluteImagePath)){
            fs.mkdirSync(absoluteImagePath, { recursive: true });
        }
        if (!fs.existsSync(imageIncludesPath)){
            fs.mkdirSync(imageIncludesPath, { recursive: true });
        }
        if (!fs.existsSync(snippetsIncludePath)){
            fs.mkdirSync(snippetsIncludePath, { recursive: true });
        }

        let tableConfig = config['extensions'][key]['tables'];
        for (let i = 0; i < tableConfig.length; i++) {
            let table = tableConfig[i]['table'];
            let prefix = getString(tableConfig[i]['prefix']);
            if (!settings.limitToTable || table === settings.limitToTable) {
                for (let k = 0; k < tableConfig[i]['screens'].length; k++) {
                    let caption = getString(tableConfig[i]['screens'][k]['caption']);
                    let name = getString(tableConfig[i]['screens'][k]['name']);
                    let filename = name ? name : getCamelCase(prefix + table);
                    let selector = getString(tableConfig[i]['screens'][k]['selector']);
                    let actions = getArray(tableConfig[i]['screens'][k]['actions']);
                    let includeRstFilename = imageIncludesPath + filename + '.rst.txt';
                    let absoluteImageFilename = absoluteImagePath + filename + '.png';
                    let relativeImageFilename = relativeImagePath + filename + '.png';

                    console.log('Actions:' + actions.length);

                    if (tableConfig[i]['screens'][k]['view'] === 'table') {
                        let pid = tableConfig[i]['screens'][k]['pid'];
                        console.log('Take Screenshot from table ' + table + ' of page ' + pid);
                        await createTableScreenshot(page, table, pid, absoluteImageFilename, selector, actions);
                        createIncludeRst(includeRstFilename, firstLine, relativeImageFilename, prefix, table, '', caption);
                    }

                    if (tableConfig[i]['screens'][k]['view'] === 'record') {
                        let uid = tableConfig[i]['screens'][k]['uid'];
                        console.log('Take Screenshot of record ' + uid + ' from table ' + table);
                        await createRecordScreenshot(page, table, uid, absoluteImageFilename, selector, actions);
                        createIncludeRst(includeRstFilename, firstLine, relativeImageFilename, prefix, table, '', caption);
                    }

                    if (tableConfig[i]['screens'][k]['view'] === 'fields') {
                        for (let j = 0; j < tableConfig[i]['fields'].length; j++) {
                            let fieldConfig = tableConfig[i]['fields'][j];
                            let field = '';
                            let caption = '';
                            let filename = '';
                            let fieldActions = actions;
                            if (typeof fieldConfig == 'string') {
                                field = fieldConfig;
                            } else {
                                field = fieldConfig['field'];
                                caption = fieldConfig['caption'];
                                filename = fieldConfig['name'];
                                if (typeof fieldConfig['actions'] === 'object'){
                                    fieldActions = fieldConfig['actions'];
                                }
                            }
                            caption = caption ? caption : 'Screenshot of field '+table+ ':' + field;
                            filename = filename ? filename : getCamelCase(prefix + field);
                            let absoluteImageFilename = absoluteImagePath + filename + '.png';
                            let relativeImageFilename = relativeImagePath + filename + '.png';
                            let includeRstFilename = imageIncludesPath + filename + '.rst.txt';
                            let includeSnippetFilename = snippetsIncludePath + filename + '.rst.txt';

                            console.log(fieldActions);

                            await createTCAScreenshot(page, table, tableConfig[i]['screens'][k]['uid'], field, absoluteImageFilename, fieldActions);
                            createIncludeRst(includeRstFilename, firstLine, relativeImageFilename, prefix, table, field, caption);
                            createSnippetIncludeRst(includeSnippetFilename, firstLine, relativeCodeSource, prefix, table, field);
                        }
                    }
                }
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

async function createTCAScreenshot(page, table, uid, field, path, actions) {
    let command = 'edit[' + table + '][' + uid + ']=edit&columnsOnly=' + field;
    let bePath = 'record/edit';
    await createScreenshot(page, table, uid, path, '.form-section', command, bePath, actions);
}

async function createTableScreenshot(page, table, pid, path, selector, actions) {
    let command = 'table=='+table;
    let bePath = 'module/web/list';
    await createScreenshot(page, table, pid, path, selector, command, bePath, actions);
}

async function createRecordScreenshot(page, table, uid, path, selector, actions) {
    let command = 'edit['+table+']['+uid+']=edit';
    let bePath = 'record/edit';
    await createScreenshot(page, table, uid, path, selector, command, bePath, actions);
}

async function createScreenshot(page, table, uid, path, selector, command, bePath, actions) {
    await page.goto(settings.baseUrl+'/typo3/'+bePath+'?token=1&'+command,
        {waitUntil: 'networkidle2'});
    if (actions) {
        await executeActions(actions, page, table, uid);
    }
    console.log('Capturing: ' + path);
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
}

async function executeActions(actions, page, table, uid) {
    for (var i = 0; i < actions.length; i++) {
        let executeAction = true;
        if (typeof actions[i]['if'] === 'object'){
            for (var j = 0; j < actions[i]['if'].length; j++) {
                if (typeof actions[i]['if'][j]['exists'] === 'string') {
                    console.log('if selector ' + actions[i]['if'][j]['exists']);
                    if (await page.$(actions[i]['if'][j]['exists']) === null) {
                        console.log('selector not found ');
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
            }
        }
    }
}

async function clickAction(actions, i, page, table, uid) {
    if (actions[i]['tab']) {
        console.log('Switching to tab ' + actions[i]['tab']);
        const [link] = await page.$x("//a[contains(., '" + actions[i]['tab'] + "')]");
        if (link) {
            await link.click();
        } else {
            await logNotFound('Tab not found: ' + actions[i]['tab']);
        }
    } else if (actions[i]['select']) {
        console.log('Opening selector ' + actions[i]['select']);
        const selector = "select[name=\"data[" + table + "][" +
            uid + "][" + actions[i]['select'] + "]\"]";
        await page.focus(selector);
        page.keyboard.type(' ');
    } else if (actions[i]['button']) {
        console.log('Clicking button ' + actions[i]['button']);
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
        console.log('Waiting for selector ' + actions[i]['selector']);
        await page.waitForSelector(actions[i]['selector'],  actions[i]['options']);
    }
    else if (actions[i]['timeout']) {
        await page.waitForTimeout(actions[i]['timeout']);
    }
}

async function changeAction(actions, i, page, table, uid) {
    if (actions[i]['select']) {
        const selector = "select[name=\"data[" + table + "][" +
            uid + "][" + actions[i]['select'] + "]\"]";
        console.log('Selecting ' + selector + 'with value ' + actions[i]['value']);
        await page.select(selector, actions[i]['value']);
    }
}

function createSnippetIncludeRst(includeSnippetFilename, firstLine, relativeCodeSource, prefix, table, field) {
    let includeRst =
        firstLine +
        "\r\n" +
        ".. literalinclude:: " + relativeCodeSource + table + ".php\r\n" +
        "   :language: php\r\n" +
        "   :start-at: start " + field + "\r\n" +
        "   :end-before: end " + field + "\r\n" +
        "   :lines: 2- \r\n" +
        "\r\n";
    fs.writeFile(includeSnippetFilename, includeRst, function (err) {
        if (err) throw err;
        console.log('Saved ' + includeSnippetFilename);
    });
}

function createIncludeRst(includeRstFilename, firstLine, imageFileName, prefix, table, field='', caption='') {
    let imageText = "Screenshot of  table " + table;
    if (field) {
        imageText = "Screenshot of  field " + field + ", table " + table ;
    }
    if (caption) {
        imageText = caption;
    }
    let alt = imageText;
    let description = imageText;
    if (field) {
        description = ":ref:`"+ imageText +
            " <tca_example_" + prefix + field + ">`";
    }
    // Create the file for including the Screenshots
    let includeRst =
        firstLine +
        "\r\n" +
        ".. figure:: " + imageFileName + "\r\n" +
        "   :alt: " + alt + "\r\n" +
        "   :class: with-shadow\r\n" +
        "\r\n" +
        "   " + description + "\r\n"
    fs.writeFile(includeRstFilename, includeRst, function (err) {
        if (err) throw err;
        console.log('Saved ' + includeRstFilename);
    });
}

async function logNotFound(text) {
    console.log('########################################');
    console.log('## ' + text);
    console.log('########################################');
}
