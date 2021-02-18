=====================
TYPO3 CMS Screenshots
=====================

This project provides a way to take screenshots of the TYPO3 CMS in a scripted way.

Installation
============

1. Install `Docker <https://docs.docker.com/get-docker/>`_ and `Docker-Compose <https://docs.docker.com/compose/install/>`_.
2. Build the environment by

   .. code-block:: bash

      mkdir .Build
      Build/Scripts/runTests.sh -s composerInstall

Take screenshots of TYPO3 + EXT:styleguide
==========================================

.. code-block:: bash

   Build/Scripts/runTests.sh -s styleguide

Check ``.Build/Web/typo3temp/var/tests/AcceptanceReports/debug`` for images.

Take screenshots of TYPO3 + EXT:introduction
============================================

.. code-block:: bash

   Build/Scripts/runTests.sh -s introduction

Check ``.Build/Web/typo3temp/var/tests/AcceptanceReports/debug`` for images.

Uninstallation
==============

.. code-block:: bash

   cd Build/testing-docker
   docker-compose down -v
