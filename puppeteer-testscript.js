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

    await page.goto('http://localhost/typo3');
    await page.waitForSelector('.typo3-login-logo');

    // Screenshot: Full page of Backend
    await page.screenshot({path: 'Screenshots/01_BE_Fullpage.png', fullPage: true});

    // 2nd shot: Login-Box
    const loginWrap = await page.$('.card-login');
    await loginWrap.screenshot({
        path: 'Screenshots/02_card-login.png',
    });

    // Screenshot: Add + 25px space around Login-Box
    const loginWrapBounds = await loginWrap.boundingBox();
    const addSpace = 25;
    await loginWrap.screenshot({
        path: 'Screenshots/03_card_login_plus25.png',
        clip: {
            x: loginWrapBounds.x - addSpace,
            y: loginWrapBounds.y - addSpace,
            width: loginWrapBounds.width + addSpace * 2,
            height: loginWrapBounds.height + addSpace * 2
        }
    });

    //
    // since here its working, now we need a specific user or the possibility to disable the login.
    //

    // // 4th shot: Form-closeup after filling username
    // const loginForm = await page.$('.panel-body');
    // const loginFormFieldUsername = await page.$('#t3-username');
    // await loginFormFieldUsername.type('demo-user');
    // await loginForm.screenshot({
    //   path: 'Screenshots/04_login_form.png'
    // });

    // // 5th shot: Form-closeup + 25px space around
    // const loginFormBounds = await loginForm.boundingBox();
    // await loginForm.screenshot({
    //   path: 'Screenshots/05_login_form_plus_25.png',
    //   clip: {
    //     x: loginFormBounds.x - addSpace,
    //     y: loginFormBounds.y - addSpace,
    //     width: loginFormBounds.width + addSpace * 2,
    //     height: loginFormBounds.height + addSpace * 2
    //   }
    // });
    //
    // await Promise.all([
    //   page.waitForNavigation(),
    //   loginFormFieldUsername.press('Enter')
    // ]);
    // await page.screenshot({path: 'Screenshots/06_Fullpage_after_login.png', fullPage: true});
    // await page.waitForTimeout(1000);
    // await page.screenshot({path: 'Screenshots/07_Fullpage_after_login_waited_1000ms.png', fullPage: true});

    await browser.close();
})()
