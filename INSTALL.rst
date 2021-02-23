============
Installation
============

*  Install `ddev <https://ddev.readthedocs.io>`_ in a version on which the latest
   `TYPO3 Version is running <https://docs.typo3.org/m/typo3/guide-contributionworkflow/master/en-us/Appendix/SettingUpTypo3Ddev.html#configure-ddev>`_
   (currently v1.16.6)
*  Clone this  `Git project <https://github.com/TYPO3-Documentation/SIG-Screenshots>`_

*  *Optional:* Consider defining different ports like so in file
   ``.ddev/config.NOT_VERSIONED.yaml``:

   .. image:: https://github.com/TYPO3-Documentation/SIG-Screenshots/blob/main/Documentation/Images/installation-config-local.png
      :alt: Example file .ddev/config.NOT_VERSIONED.yaml

*  :code:`ddev start`

*  :code:`ddev prepare`

*  :code:`ddev exec node puppeteer-testscript.js`

*  Find the Screenshots in ``Screenshots/``

*  Log into the backend: https://sig-screenshots.ddev.site/typo3/

*  Username: admin

*  Password: demo.typo3

*  Clone the manual you want to work on into ``public/OriginalManual`` of this
   project. This currently only works with the master branch of the
   `TCA reference <https://github.com/TYPO3-Documentation/TYPO3CMS-Reference-TCA>`_

*  Run :code:`ddev exec node typo3.js --suite=TYPO3CMS-Reference-TCA --limitToTable=tt_content` --stopOnFirstError=false

*  Open http://sig-screenshots.ddev.site/scripts/index.php
