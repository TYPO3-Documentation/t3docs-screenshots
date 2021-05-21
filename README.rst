.. image:: https://github.com/TYPO3-Documentation/t3docs-screenshots/actions/workflows/tests.yml/badge.svg
   :alt: Testing Status

=====================
TYPO3 CMS Screenshots
=====================

This project provides a way to take screenshots of the TYPO3 CMS in a scripted way.

First, the user browses a TYPO3 instance to take notes of a click path for a new screenshot.
Next, the click path gets forged to a ``screenshots.json`` file.
Next, all ``screenshots.json`` files get executed by the screenshots runner which produces the screenshots.
Last, the actual screenshots get compared to the original screenshots in the screenshots manager and copied over if
approved by the user.

Activity of the screenshots runner:

.. image:: docs/screenshots_runner_diagram.png
   :alt: Activity diagram of the screenshots runner

.. contents:: Table of Contents


Prerequisites
=============

Install

1.  `Docker <https://docs.docker.com/get-docker/>`_
2.  `Docker-Compose <https://docs.docker.com/compose/install/>`_
3.  `DDEV <https://ddev.readthedocs.io/en/stable/>`_


Browsable TYPO3 instance
========================

Installation
------------

1. Build the environment by

   .. code-block:: bash

      ddev install

2. Navigate in your browser to the website and complete the installation:

   .. code-block:: bash

      ddev launch

3. Log into the TYPO3 backend
4. Optionally activate the page tree of ``EXT:styleguide`` or ``EXT:introduction``:

   -  initialize the page tree of ``EXT:introduction`` by de- and reactivating this extension - or -
   -  initialize the page tree of ``EXT:styleguide`` by clicking in the upper right corner
      "(?)" -> "Styleguide" -> "TCA / Records" -> "Create styleguide page tree with data".

Re-Installation
---------------

You might want to setup the TYPO3 instance from scratch to initialize it with a distinct page tree. This can be easily
achieved by running the steps of the installation section again.

Stop
----

Stop the TYPO3 instance by

.. code-block:: bash

   ddev stop

Start
-----

Start the TYPO3 instance by

.. code-block:: bash

   ddev start

Uninstallation
--------------

Remove the TYPO3 instance by

.. code-block:: bash

   ddev delete -yO


Screenshots runner
==================

The runner scans the sub folders of ``public/t3docs``, processes the ``public/t3docs/*/screenshots.json`` files and
creates the screenshots in ``public/t3docs-generated/actual/*/`` where they get further processed by the screenshots
manager.

Folders in ``public/t3docs``
----------------------------

The folders in ``public/t3docs`` should contain the official TYPO3 Documentation manuals or other documentation that
needs fresh screenshots of TYPO3. Get all official TYPO3 Documentation manuals in one bundle (requires access
permission) by

.. code-block:: bash

   ddev auth ssh
   ddev fetch-manuals

File ``screenshots.json``
-------------------------

The runner configuration file ``screenshots.json`` must be placed in the root directory of the respective documentation
folder, i.e. in ``public/t3docs/*/screenshots.json``. It defines in the first level the TYPO3 environment
(e.g. "Core", "Styleguide", "Introduction", etc.) where the screenshots are taken, and in the second level it lists
blocks of actions where each block ends with a captured screenshot. Each action is an object, where the key ``action``
marks the action name and the remaining keys represent the action parameters.

Create a basic ``screenshots.json`` in an arbitrary manual folder at ``public/t3docs`` by

.. code-block:: bash

   ddev init-screenshot-json [-t folder]

where ``folder`` defaults to ``My-Manual`` if left blank.

This is a small runner configuration which takes screenshots of three TYPO3 environments:

.. code-block:: json

   {
      "suites": {
         "Core": {
            "screenshots": [
               [
                  {"action": "makeScreenshotOfWindow", "fileName": "core_dashboard"}
               ]
            ]
         },
         "Introduction": {
            "screenshots": [
               [
                  {"action": "makeScreenshotOfFullPage", "fileName": "introduction_dashboard_full_page"}
               ]
            ]
         },
         "Styleguide": {
            "screenshots": [
               [
                  {"action": "makeScreenshotOfTable", "pid": 0, "table": "pages", "fileName": "styleguide_root_page"}
               ],
               [
                  {"action": "makeScreenshotOfRecord", "table": "pages", "uid": 1, "fileName": "styleguide_first_page_record"}
               ]
            ]
         }
      }
   }

The target folder of the screenshots is ``Documentation/Images/AutomaticScreenshots`` by default and is calculated
relative to the ``screenshots.json``. The path can be adapted by the actions ``setScreenshotsDocumentationPath`` and
``setScreenshotsImagePath`` respectively, e.g.

.. code-block:: json

   {
      "suites": {
         "Introduction": {
            "screenshots": [
               [
                  {"action": "setScreenshotsDocumentationPath", "path": "IntroductionDocumentation"},
                  {"action": "setScreenshotsImagePath", "path": "Images/IntroductionScreenshots"},
                  {"action": "makeScreenshotOfWindow", "fileName": "introduction_dashboard"}
               ]
            ]
         }
      }
   }

To steer the runner through the TYPO3 backend, many TYPO3 specific actions have been added to the general browser
navigation actions, e.g.

.. code-block:: json

   {
      "suites": {
         "Styleguide": {
            "screenshots": [
               [
                  {"action": "switchToMainFrame"},
                  {"action": "scrollModuleMenuTo", "toSelector": "#web_list"},
                  {"action": "click", "link": "List"},
                  {"action": "openPageTreePath", "path": ["styleguide TCA demo", "elements rte"]},
                  {"action": "scrollPageTreeTo", "toSelector": "#identifier-0_12"},
                  {"action": "switchToContentFrame"},
                  {"action": "waitForText", "text": "elements rte", "timeout": 5},
                  {"action": "scrollModuleBodyToBottom"},
                  {"action": "makeScreenshotOfWindow", "fileName": "stylesheet_content_scrolled_down"},
               ]
            ]
         }
      }
   }

To guide the reader of the documentation over the screenshot, DOM elements can be highlighted by actions ``drawBox``,
``drawArrow``, ``drawBadge``, etc. and the highlighting can be removed later by action ``clearDrawings``, e.g.

.. code-block:: json

   {
      "suites": {
         "Introduction": {
            "screenshots": [
               [
                  {"action": "drawBox", "selector": "#dashboard"},
                  {"action": "drawArrow", "selector": "#dashboard", "position": "right-bottom"},
                  {"action": "drawBadge", "selector": "#dashboard", "label": "Click here", "position": "bottom"},
                  {"action": "makeScreenshotOfWindow", "fileName": "introduction_dashboard_with_highlighted_menuitem"},
                  {"action": "clearDrawings"},
                  {"action": "makeScreenshotOfWindow", "fileName": "introduction_dashboard_without_highlighted_menuitem"}
               ]
            ]
         }
      }
   }

Along with the screenshot a reStructuredText file gets created automatically in the folder ``Documentation/Images/Rst``
and can be used to include the screenshot comfortably into a documentation. The path can be changed by the actions
``setScreenshotsDocumentationPath`` and ``setScreenshotsRstPath`` and the automatic creation can be switched via action
``createScreenshotsRstFile``, e.g.

.. code-block:: json

   {
      "suites": {
         "Introduction": {
            "screenshots": [
               [
                  {"action": "setScreenshotsDocumentationPath", "path": "IntroductionDocumentation"},
                  {"action": "setScreenshotsRstPath", "path": "Images/IntroductionRst"},
                  {"action": "makeScreenshotOfWindow", "fileName": "introduction_dashboard_with_rst_file"},
                  {"action": "createScreenshotsRstFile", "create": false},
                  {"action": "makeScreenshotOfWindow", "fileName": "introduction_dashboard_without_rst_file"}
               ]
            ]
         }
      }
   }

Another redundant documentation job besides taking screenshots is to insert and update code snippets. With action
``createCodeSnippet`` a specific TYPO3 code source file gets transformed into a reStructuredText file for inclusion and
gets saved to folder ``Documentation/CodeSnippets``. The folder can be changed by ``setCodeSnippetsTargetPath``.
Furthermore there are dedicated actions like ``createPhpArrayCodeSnippet`` or ``createXmlCodeSnippet`` to store only
excerpts of code files.

.. code-block:: json

   {
      "suites": {
         "Styleguide": {
            "screenshots": [
               [
                  {"action": "setCodeSnippetsTargetPath", "path": "CodeSnippets/StyleguideCode"},
                  {"action": "createCodeSnippet", "sourceFile": "typo3/sysext/core/Configuration/TCA/be_groups.php", "targetFileName": "core_be_groups"},
                  {"action": "createPhpArrayCodeSnippet", "sourceFile": "typo3/sysext/core/Configuration/TCA/be_groups.php", "field": "types", "targetFileName": "core_be_groups_types"},
                  {"action": "createXmlCodeSnippet", "sourceFile": "typo3/sysext/form/Configuration/FlexForms/FormFramework.xml", "field": "T3DataStructure/sheets/sDEF", "targetFileName": "FormFrameworkXmlSheetSDef"}
               ]
            ]
         }
      }
   }

Actions can be nested to use the return value of the inner action by the outer, e.g.

.. code-block:: json

   {
      "suites": {
         "Styleguide": {
            "screenshots": [
               [
                  {
                     "action": "makeScreenshotOfTable",
                     "pid": {"action": "getUidByField", "table": "pages", "field": "title", "value": "elements rte"},
                     "table": "pages",
                     "fileName": "styleguide_root_page"
                  }
               ]
            ]
         }
      }
   }

which executes the action ``getUidByField()`` and uses the return value for parameter ``pid`` of action
``makeScreenshotOfTable()``.

Comments can be inserted to facilitate maintenance work, e.g.

.. code-block:: json

   {
      "suites": {
         "Styleguide": {
            "screenshots": [
               [
                  {"comment": "************************************"},
                  {"comment": "Take screenshots of TYPO3 TCA table."},
                  {"comment": "************************************"},
                  {"action": "makeScreenshotOfTable", "pid": 27, "table": "pages", "fileName": "styleguide_root_page"}
               ]
            ]
         }
      }
   }

Available Actions
-----------------

As action all codeception actions are supported including the actions of the packages ``typo3/testing-framework`` and
``typo3/screenshots``. All available actions get compiled into
``packages/screenshots/Classes/Runner/Codeception/Support/_generated/PhotographerActions.php`` - ready for lookup.

A new action should be added to the files of ``packages/screenshots/Classes/Runner/Codeception/Support/Helper`` and then be
compiled into the ``PhotographerActions.php`` by

.. code-block:: bash

   ddev exec vendor/bin/codecept build -c public/typo3conf/ext/screenshots/Classes/Runner/codeception.yml

Make all screenshots
--------------------

.. code-block:: bash

   ddev make-screenshots

Make screenshots of specific ``screenshots.json`` file
------------------------------------------------------

A folder path can be specified to execute only the actions of this particular ``screenshots.json``. The folder path can
be defined as an absolute path or relative to ``public/t3docs``, e.g. this command executes only
``public/t3docs/My-Manual/screenshots.json``.

.. code-block:: bash

   ddev make-screenshots -t My-Manual

Make screenshots of TYPO3
-------------------------

.. code-block:: bash

   ddev make-screenshots -s Core

Make screenshots of TYPO3 + EXT:styleguide
------------------------------------------

.. code-block:: bash

   ddev make-screenshots -s Styleguide

Make screenshots of TYPO3 + EXT:introduction
--------------------------------------------

.. code-block:: bash

   ddev make-screenshots -s Introduction

Make screenshots of TYPO3 + EXT:introduction + Subset of actions
----------------------------------------------------------------

A custom identifier can be assigned to a block of actions and then used to execute only that specific subset of actions.

.. code-block:: json

   {
      "suites": {
         "Styleguide": {
            "screenshots": {
               "root-page": [
                  {"action": "makeScreenshotOfTable", "pid": 0, "table": "pages", "fileName": "styleguide_root_page"}
               ],
               "first-page": [
                  {"action": "makeScreenshotOfRecord", "table": "pages", "uid": 1, "fileName": "styleguide_first_page_record"}
               ]
            }
         }
      }
   }

.. code-block:: bash

   ddev make-screenshots -s Styleguide -a first-page


Screenshots manager
===================

To manage the created screenshots the TYPO3 instance backend provides a module "Screenshots" which can be found in the
module menu at Admin Tools > Screenshots. It provides three functions: Starting the screenshots runner, comparing actual
and original screenshots and copying screenshots from the actual path to the original path.

Welcome
-------

On the welcome page you can select the action you want to perform:

- create screenshots by processing the available ``screenshots.json`` through the screenshots runner or
- compare new screenshots with the originals and copy the new screenshots

.. image:: docs/screenshots_manager_welcome.png

Make screenshots
----------------

On this page you automatically start the screenshots runner, which starts a subprocess on the command line.
The result is displayed on this page as soon as the runner is finished - which may take a while.

.. image:: docs/screenshots_manager_make.png

To comfortably work with a large number of ``screenhots.json`` and actions, the number of actions can be reduced by
using the filter at the top of the page: Only actions matching the path, suite and action ID criteria will then be
executed.

Compare & copy screenshots
--------------------------

On this page you compare the newly created screenshots of the runner with the originals. Each list item shows the
current state on the left, the original state on the right and the difference map in the middle. At the top it shows
the difference as a number.

Each screenshot is selected for copying by default, but can be deselected individually and in aggregation. All text
files such as the screenshot reST include files or the code snippets cannot be compared, but can only be selected or
deselected for copying in bundles: They must be handled externally by the Git comparison tools.

.. image:: docs/screenshots_manager_compare.png

To work comfortably with a large number of files, the list of screenshots and text files can be reduced by entering
a path in the search field at the top of the page: Only files with a matching path will then be displayed. Regular
expressions are supported and automatic suggestion of available paths is enabled.

.. image:: docs/screenshots_manager_compare_searchbox.png

When you have confirmed the changes, pressing the "Copy screenshots" button will copy the screenshots to the original
location.

.. image:: docs/screenshots_manager_copy.png

Eventually, the original screenshots were updated and the changes can be committed and pushed.

Development
===========

Run unit tests by

.. code-block:: bash

   ddev run-unit-tests
