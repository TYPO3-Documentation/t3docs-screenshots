const puppeteer = require('puppeteer');
(async () => {
    const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    const page = await browser.newPage();
    const firstLine = ".. Automatic screenshot: Remove this line if you wand to manually change this file\r\n"

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

    let tcaFields = require('./styleguideTca.json');

    let extensionPath = 'Styleguide/';
    let absoluteImagePath = 'public/Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/' + extensionPath + 'AutomaticScreenshots/';
    let relativeImagePath = '/Examples/Images/' + extensionPath + 'AutomaticScreenshots/';
    let imageIncludesPath = 'public/Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/' + extensionPath + "RstIncludes/";
    let snippetsIncludePath = 'public/Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Snippets/' + extensionPath + "RstIncludes/";

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


    for (let i = 0; i < tcaFields.length; i++) {
        for (let j = 0; j < tcaFields[i]['fields'].length; j++) {
            // Create the Screenshots
            let field = tcaFields[i]['fields'][j];
            let table = tcaFields[i]['table'];
            let prefix = '';
            if(typeof tcaFields[i]['prefix'] == 'string') {
                prefix = tcaFields[i]['prefix'];
            }
            let filename =  toCamelCase(prefix + field);
            let imageFileName = filename + '.png';

            await createTCAScreenshot(table, tcaFields[i]['uid'], field, absoluteImagePath + imageFileName);

            let includeRstFilename = imageIncludesPath + filename + '.rst.txt';
            createIncludeRst(includeRstFilename, relativeImagePath + imageFileName, prefix,  table, field);

            let includeSnippetFilename = snippetsIncludePath + filename + '.rst.txt';
            createSnippetIncludeRst(includeSnippetFilename, prefix,  table, field);

        }
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

    function createIncludeRst(includeRstFilename, imageFileName, prefix, table, field) {
        // Create the file for including the Screenshots
        let includeRst =
            firstLine +
            "\r\n" +
            ".. figure:: " + imageFileName + "\r\n" +
            "   :alt: Screenshot of  field " + field + ", table " + table + "\r\n" +
            "   :class: with-shadow\r\n" +
            "\r\n" +
            "   :ref:`Screenshot of  field " + field + ", table " + table + " <tca_example_" + prefix + field + ">`\r\n"
        fs.writeFile(includeRstFilename, includeRst, function (err) {
            if (err) throw err;
            console.log('Saved ' + includeRstFilename);
        });
    }

    async function createTCAScreenshot(table, uid, field, path) {
        await page.goto('http://localhost/typo3/record/edit?token=9&edit[' + table + '][' + uid + ']=edit&columnsOnly=' + field, {waitUntil: 'networkidle2'});
        const formSection = await page.$('.form-section');

        console.log('Capturing: ' + path);
        await formSection.screenshot({
            path: path,
        });
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