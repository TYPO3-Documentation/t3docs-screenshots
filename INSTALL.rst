*  Clone Git project
*  :code:`ddev start`
*  :code:`ddev prepare`
*  :code:`ddev puppeteer puppeteer-testscript.js`
*  find the Screenshots in  Screenshots/
*  Log into the backend: https://sig-screenshots.ddev.site/typo3/
*  Username: admin
*  Password: demo.typo3
*  Clone the Manual you want to work on into public/OriginalManual of this project. This currently only works with the master branch of the TCA reference
*  run :code:`ddev puppeteer puppeteer-TCA.js`
*  Open http://sig-screenshots.ddev.site/scripts/index.php
