Installation
============

#. Clone the `Git project <https://github.com/TYPO3-Documentation/SIG-Screenshots>`_

#. *Optional:* Consider defining different ports like so in file
   ``.ddev/config.NOT_VERSIONED.yaml``:

   .. image:: Documentation/Images/installation-config-local.png
      :alt: Example file .ddev/config.NOT_VERSIONED.yaml

#. :code:`ddev start`

#. :code:`ddev prepare`

#. :code:`ddev puppeteer puppeteer-testscript.js`

#. Find the screenshots in `Screenshots/`

#. Log into the backend: https://sig-screenshots.ddev.site/typo3/
   with username and password: ``admin``, ``demo.typo3``

