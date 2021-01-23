const puppeteer = require('puppeteer');
(async () => {
    const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    const page = await browser.newPage();

    // Set size of "browser window" - cannot click outside this area.
    await page.setViewport({width: 1024, height: 768});

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
    await page.screenshot({path: 'Screenshots/07_Fullpage_after_login_waited_1000ms.png', fullPage: true});

    const listModule = await page.$('#web_list');
    listModule.click();
    await page.waitForTimeout(1000);
    await page.screenshot({path: 'Screenshots/08_ListModule.png', fullPage: true});

    // https://sig-screenshots.ddev.site/typo3/record/edit?token=9b3353c91c64fcab3c591ef82a3278558a6ff650&edit%5Btx_styleguide_inline_11%5D%5B1%5D=edit


    await page.goto('http://localhost/typo3/record/edit?token=9b3353c91c64fcab3c591ef82a3278558a6ff650&edit%5Btx_styleguide_inline_11%5D%5B1%5D=edit', {waitUntil: 'networkidle2'});
    await page.screenshot({path: 'Screenshots/Screen09.png', fullPage: true});
    /*
    const tree2 = await page.$(".identifier-0_8");
    await tree2.click();
    await page.screenshot({path: 'Screenshots/Screen10.png', fullPage: true});
*/
    await browser.close();
})()
