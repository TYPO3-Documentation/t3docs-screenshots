const puppeteer = require('puppeteer');


(async () => {
    const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    const page = await browser.newPage();
    const limitToTable = 'tx_styleguide_elements_select';

    // Set size of "browser window" - cannot click outside this area.
    await page.setViewport({width: 640, height: 640});

    await page.goto('http://localhost');
    await page.waitForSelector('body');

    // Screenshot: Full page of Frontend
    await page.screenshot({path: 'Screenshots/00_FE_Fullpage.png', fullPage: true});

    // Switch to backend
    await page.goto('http://localhost/typo3/login', {waitUntil: 'networkidle2'});
    await page.waitForSelector('#loginCopyright');

    // Screenshot: Full page of Backend
    await page.screenshot({path: 'Screenshots/01_BE_Fullpage.png', fullPage: true});

    // 2nd shot: Login-Box
    // await page.waitForTimeout(250);
    const loginWrap = await page.$('div.card.card-lg.card-login');
    await loginWrap.screenshot({
        path: 'Screenshots/02_card-login.png',
    });

    // Screenshot: Add + 25px space around Login-Box
    const loginWrapBounds = await loginWrap.boundingBox();
    await loginWrap.screenshot({
        path: 'Screenshots/03_card_login_plus25.png',
        clip: {
            x: loginWrapBounds.x - 25,
            y: loginWrapBounds.y - 25,
            width: loginWrapBounds.width + 25 * 2,
            height: loginWrapBounds.height + 25 * 2
        }
    });

    // // 4th shot: Form-closeup after filling username
    const loginForm = await page.$('.typo3-login-form');
    const loginFormSubmitButton = await page.$('#t3-login-submit');
    await page.type('#t3-username', 'pptr_admin');
    await page.type('#t3-password', 'pptr_admin');

    await loginForm.screenshot({
        path: 'Screenshots/04_login_form.png'
    });
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

    await Promise.all([
        page.waitForNavigation(),
        loginFormSubmitButton.click()
    ]);

    // creating the needed directories

    const config = require('./public/OriginalManual/TYPO3CMS-Reference-TCA/Scripts/GenerateScreenshots/Config.json');

    const firstLine = config['comments']['rst.txt'] + "\r\n";

    const outputPath = 'public/Output/TYPO3CMS-Reference-TCA/';
    for(var key in config['extensions']){
        let extensionConfig = config['extensions'][key];

        let absoluteImagePath = outputPath + extensionConfig['paths']['imageSource'];
        let relativeImagePath = extensionConfig['paths']['relativeImagePath'];
        let imageIncludesPath = outputPath + extensionConfig['paths']['imageRst'];
        let snippetsIncludePath = outputPath + extensionConfig['paths']['codeRst'];

        let fs = require('fs');
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
            let prefix = strFromConfig(tableConfig[i]['prefix']);
            if (!limitToTable || table === limitToTable) {
                for (let k = 0; k < tableConfig[i]['screens'].length; k++) {

                    let caption = strFromConfig(tableConfig[i]['screens'][k]['caption']);
                    let name = strFromConfig(tableConfig[i]['screens'][k]['name']);
                    let filename = name ? name : toCamelCase(prefix + table);
                    let selector = strFromConfig(tableConfig[i]['screens'][k]['selector']);
                    let actions = arrayFromConfig(tableConfig[i]['screens'][k]['actions']);

                    console.log('Actions:' + actions.length);
                    if (tableConfig[i]['screens'][k]['view'] === 'table') {

                        let pid = tableConfig[i]['screens'][k]['pid'];
                        console.log('Take Screenshot of  ' + table + ' ' + pid);
                        await createTableScreenshot(table, pid,
                            absoluteImagePath + filename + '.png',
                            selector, actions);
                        let includeRstFilename = imageIncludesPath + filename + '.rst.txt';
                        createIncludeRst(includeRstFilename,
                            relativeImagePath + filename + '.png',
                            prefix, table, '', caption);
                    }
                    if (tableConfig[i]['screens'][k]['view'] === 'record') {

                        let uid = tableConfig[i]['screens'][k]['uid'];
                        console.log('Take Screenshot of record ' + table + ' uid ' + uid);
                        await createRecordScreenshot(table, uid,
                            absoluteImagePath + filename + '.png',
                            selector, actions);
                        let includeRstFilename = imageIncludesPath + filename + '.rst.txt';
                        createIncludeRst(includeRstFilename,
                            relativeImagePath + filename + '.png',
                            prefix, table, '', caption);
                    }
                    if (tableConfig[i]['screens'][k]['view'] === 'fields') {
                        for (let j = 0; j < tableConfig[i]['fields'].length; j++) {
                            // Create the Screenshots
                            let fieldConfig = tableConfig[i]['fields'][j];
                            let field = '';
                            let caption = '';
                            if (typeof fieldConfig == 'string') {
                                field = fieldConfig;
                            } else {
                                field = fieldConfig['field'];
                                caption = fieldConfig['caption'];
                            }
                            let filename = toCamelCase(prefix + field);
                            let imageFileName = filename + '.png';

                            await createTCAScreenshot(table,
                                tableConfig[i]['screens'][k]['uid'], field,
                                absoluteImagePath + imageFileName);

                            let includeRstFilename = imageIncludesPath +
                                filename + '.rst.txt';
                            createIncludeRst(includeRstFilename,
                                relativeImagePath + imageFileName,
                                prefix, table, field, caption);

                            let includeSnippetFilename = snippetsIncludePath
                                + filename + '.rst.txt';
                            createSnippetIncludeRst(includeSnippetFilename, prefix,
                                table, field);
                        }
                    }
                }
            }
        }
    }

    function strFromConfig(config) {
        let ret = '';
        if (typeof config == 'string') {
            ret = config;
        }
        return ret;
    }

    function arrayFromConfig(config) {
        let ret = [];
        if (typeof config == 'object') {
            ret = config;
        }
        return ret;
    }


    function createSnippetIncludeRst(includeSnippetFilename, prefix, table, field) {
        let includeRst =
            firstLine +
            "\r\n" +
            ".. literalinclude:: /Examples/Snippets/Styleguide/Sources/" + table + ".php\r\n" +
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

    function createIncludeRst(includeRstFilename, imageFileName,
                              prefix, table, field='',
                              caption='') {

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

    async function createTCAScreenshot(table, uid, field, path) {
        let command = 'edit[' + table + '][' + uid + ']=edit&columnsOnly=' + field;
        let bePath = 'record/edit';
        await createScreenshot(table, uid, path, '.form-section', command, bePath);
    }

    async function createTableScreenshot(table, pid, path, selector) {
        let command = 'table=='+table;
        let bePath = 'module/web/list';
        await createScreenshot(table, pid, path, selector, command, bePath);
    }
    async function createRecordScreenshot(table, uid, path, selector, actions) {
        let command = 'edit['+table+']['+uid+']=edit';
        let bePath = 'record/edit';
        await createScreenshot(table, uid, path, selector, command, bePath, actions);
    }
    async function createScreenshot(table, uid, path, selector, command, bePath, actions) {
        await page.goto('http://localhost/typo3/'+bePath+'?token=1&'+command,
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

    function toCamelCase(string) {
        var splitStr = string.toLowerCase().split('_');
        for (var k = 0; k < splitStr.length; k++) {
            splitStr[k] = splitStr[k].charAt(0).toUpperCase() + splitStr[k].substring(1);
        }
        return splitStr.join('');
    }

    await browser.close();
})()



async function executeActions(actions, page, table, uid) {
    for (var i = 0; i < actions.length; i++) {
        if (actions[i]['action'] === 'click') {
            await clickAction(actions, i, page, table, uid);
        }
        else if (actions[i]['action'] === 'change') {
            await changeAction(actions, i, page, table, uid);
        }
        else if (actions[i]['action'] === 'wait') {
            await waitAction(actions, i, page, table, uid);
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
        console.log('Opening selctor ' + actions[i]['select']);
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
    }
}

async function logNotFound(text) {

    console.log('########################################');
    console.log('## ' + text);
    console.log('########################################');
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
