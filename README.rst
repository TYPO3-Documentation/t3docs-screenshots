=====================
TYPO3 CMS Screenshots
=====================

This project provides a way to take screenshots of the TYPO3 CMS in a scripted way.

Installation
============

1. Install `Docker <https://docs.docker.com/get-docker/>`_, `Docker-Compose <https://docs.docker.com/compose/install/>`_
   and `DDEV <https://ddev.readthedocs.io/en/stable/>`_.
2. Build the environment by

   .. code-block:: bash

      ddev install

Browse the TYPO3 instance
=========================

.. code-block:: bash

   ddev launch

Reinstall the TYPO3 instance
============================

You might want to setup the TYPO3 instance from scratch to initialize it with a distinct page tree. Run

.. code-block:: bash

   ddev install

and activate the page tree of ``EXT:styleguide`` or ``EXT:introduction``.

Take screenshots of TYPO3 + EXT:styleguide
==========================================

.. code-block:: bash

   .docker/run.sh -s styleguide

Check ``public/typo3temp/var/tests/AcceptanceReports/debug`` for images.

Take screenshots of TYPO3 + EXT:introduction
============================================

.. code-block:: bash

   .docker/run.sh -s introduction

Check ``public/typo3temp/var/tests/AcceptanceReports/debug`` for images.

Uninstallation
==============

.. code-block:: bash

   # Remove browsable TYPO3 instance
   ddev stop -ORU

   # Remove screenshot runner
   cd .docker && docker-compose down -v && cd -
