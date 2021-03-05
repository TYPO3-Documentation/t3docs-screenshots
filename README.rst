=====================
TYPO3 CMS Screenshots
=====================

This project provides a way to take screenshots of the TYPO3 CMS in a scripted way.

First, the user browses a TYPO3 instance to take notes of a click path for a new screenshot.
Next, the click path gets forged to a code block.
Last, all code blocks get executed by the screenshot runner which produces the screenshots.


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

   .docker/run.sh -s styleguide

Check ``public/typo3temp/var/tests/AcceptanceReports/debug`` for images.

Take screenshots of TYPO3 + EXT:introduction
--------------------------------------------

.. code-block:: bash

   .docker/run.sh -s introduction

Check ``public/typo3temp/var/tests/AcceptanceReports/debug`` for images.

Uninstallation
--------------

Remove the screenshot runner by

.. code-block:: bash

   cd .docker && docker-compose down -v && cd -
