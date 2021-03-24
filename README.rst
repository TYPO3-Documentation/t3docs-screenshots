=====================
TYPO3 CMS Screenshots
=====================

This project provides a way to take screenshots of the TYPO3 CMS in a scripted way.

First, the user browses a TYPO3 instance to take notes of a click path for a new screenshot.
Next, the click path gets forged to a code block.
Next, all code blocks get executed by the screenshot runner which produces the screenshots.
Last, the actual screenshots get compared to the original screenshots and copied over if approved by the user.


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

3. Log into the TYPO3 backend and activate the page tree of ``EXT:styleguide`` or ``EXT:introduction``.

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


Screenshot runner
=================

Take screenshots of TYPO3 + EXT:styleguide
------------------------------------------

.. code-block:: bash

   ddev make-screenshots Styleguide

Check ``public/typo3temp/var/tests/AcceptanceReports/debug`` for images.

Take screenshots of TYPO3 + EXT:introduction
--------------------------------------------

.. code-block:: bash

   ddev make-screenshots Introduction

Check ``public/typo3temp/var/tests/AcceptanceReports/debug`` for images.


Screenshots manager
===================

To manage the created screenshots the TYPO3 instance backend provides a module "Screenshots" which can be found in the
module menu at Admin Tools > Screenshots. It provides two functions: Comparing actual and original screenshots and
copying screenshots from the actual path to the original path.

.. image:: docs/typo3_screenshots_module.png
