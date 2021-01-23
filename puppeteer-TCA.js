const puppeteer = require('puppeteer');
(async () => {
    const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    const page = await browser.newPage();

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
    await page.screenshot({path: 'Screenshots/06_Fullpage_after_login.png', fullPage: true});
    await page.waitForTimeout(1000);

    let tcaFields = [
        {
            table: 'tx_styleguide_elements_basic',
            path: 'Screenshots/Styleguide/',
            uid: 7,
            fields:
                [
                    'input_1',
                    'input_30',
                    'input_34',
                    'inputdatetime_3',
                    'input_28',
                    'input_30',
                    'input_33',
                    'input_29',
                    'none_1',
                    'radio_1',
                    'checkbox_2',
                    "checkbox_3",
                    "checkbox_12",
                    "checkbox_16",
                    "checkbox_17",
                    "checkbox_18",
                    "checkbox_19",
                    "checkbox_21",
                ]
        },
        {
            table: 'tx_styleguide_elements_select',
            path: 'Screenshots/Styleguide/',
            uid: 1,
            fields:
                [
                    'select_checkbox_3',
                    'select_multiplesidebyside_5',
                    'select_single_3',
                    'select_single_12',
                    'select_single_10',
                    'select_singlebox_1',
                    'select_tree_1',
                ]
        },
        {
            table: 'tx_styleguide_elements_rte',
            path: 'Screenshots/Styleguide/',
            uid: 1,
            fields:
                [
                    'rte_1',
                ]
        },
        {
            table: 'tx_styleguide_elements_t3editor',
            path: 'Screenshots/Styleguide/',
            uid: 1,
            fields:
                [
                    't3editor_1',
                ]
        },
        {
            table: 'tx_styleguide_elements_group',
            path: 'Screenshots/Styleguide/',
            uid: 1,
            fields:
                [
                    'group_db_1',
                ]
        },
        {
            table: 'tx_styleguide_inline_1n',
            path: 'Screenshots/Styleguide/Inline1n',
            uid: 1,
            fields:
                [
                    'inline_1',
                ]
        },
        {
            table: 'tx_styleguide_inline_1n1n',
            path: 'Screenshots/Styleguide/Inline1n1n',
            uid: 1,
            fields:
                [
                    'inline_1',
                ]
        },
        {
            table: 'tx_styleguide_inline_fal',
            path: 'Screenshots/Styleguide/InlineFal',
            uid: 1,
            fields:
                [
                    'inline_1',
                ]
        },
        {
            table: 'tx_styleguide_inline_mn',
            path: 'Screenshots/Styleguide/InlineMn',
            uid: 1,
            fields:
                [
                    'inline_1',
                ]
        },
        {
            table: 'tx_styleguide_inline_mnsymmetric',
            path: 'Screenshots/Styleguide/InlineMnSymmetric',
            uid: 11,
            fields:
                [
                    'branches',
                ]
        },
    ];

    for (let i = 0; i < tcaFields.length; i++) {
        for (let j = 0; j < tcaFields[i]['fields'].length; j++) {
            let field = tcaFields[i]['fields'][j];
            let filename =  toCamelCase(field);
            await shootTCA(tcaFields[i]['table'], tcaFields[i]['uid'], field,
                tcaFields[i]['path'] + filename + '.png');
        }
    }

    async function shootTCA(table, uid, field, path) {
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

    /*
    const tree2 = await page.$(".identifier-0_8");
    await tree2.click();
    await page.screenshot({path: 'Screenshots/Screen10.png', fullPage: true});
*/
    await browser.close();
})()