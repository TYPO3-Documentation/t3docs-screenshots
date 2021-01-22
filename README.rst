===============
SIG Screenshots
===============

Call about Budget and Kick off
==============================

Friday, 22.01.2021, 10:00 CET Phone conferenz in Slack chat

Links
=====

*  `update-outdated-screenshots-in-the-official-documentation <https://talk.typo3.org/t/update-outdated-screenshots-in-the-official-documentation/3830>`__
*  `markerjs2 <https://github.com/ailon/markerjs2>`__

T3Docs: Image creation
======================

Standardize the creation of images for TYPO3 documentation. Defining a style guide and providing icon sets for images is already a good start. What’s still missing are some decisions on the completion of the style guide, the selection of the final icon set and the addition of rules to facilitate the mass processing of images due to changes in the style guide or the creation of new screenshots of a new TYPO3 UI.

Concept - Style guide
---------------------

1. Define the final style guide which should be used for all images of TYPO3 documention <= 11
2. Create the final icon set which should be used for all images of TYPO3 documentation <= 11
3. Provide consistent information of both at docs.typo3.org

Concept - Tutorial
------------------

1. Provide a tutorial for creating a final documentation image out of a screenshot at docs.typo3.org
2. Use open source software only which can be easily installed and used by non-designers (e.g. Inkscape)

Concept - Screenshot Extension
------------------------------

Create a TYPO3 extension that offers overlays of boxes, arrows and numbers in the styleguide.

Concept - Style guide bulk processing
-------------------------------------

To facilitate the application of style guide changes to all images in the TYPO3 documentation, a consistent method of creating images using screenshots and symbol sets would be helpful.

1. Add rules to style guide which allow easy bulk processing of all images by a script

   * use SVG as container which is an XML format and can be processed easily by scripts
   * one layer for the bitmap image / screenshot
   * one layer for the vector images / icons
   * the icon objects should probably have unique ids for better identification in bulk processing script
   * maintain a SVG file and a compiled PNG file per screenshot with icons

2. Create a script which can apply style guide changes in bulk processing

   * scan all directories for files
   * use simple PHP string and regexp functions for replacing old icon objects and styling formats by new ones
   * use ImageMagick integration for convertion from SVG -> PNG
   * Add script which checks pushed images for style guide rules

3. Provide the bulk processing script and documentation at a central place

Concept - Screenshot bulk processing
------------------------------------

To facilitate the creation of up-to-date screenshots of a new TYPO3 major version, an automated, consistent way of creating screenshots would be helpful.

1. Add screenshot tours to TYPO3 core extensions which walk the TYPO3 backend and take screenshots in a scripted way

   * could be done by Codecept + Selenium + Chrome / Firefox Driver (a.k.a. Acceptance Tests)
   * would help to render all screenshots in a consistent way (same browser, resolution)

2. Create a script which can walk all documentation SVG images and compile new PNG images by replacing the old by the new screenshot in the SVG and compiling as usual (see Concept - Style guide bulk processing).

3. Provide the bulk processing script and documentation at a central place

Hint: This script will only support and not completely replace the production of up-to-date screenshots as there will still a human have to check all new images and crop new screenshots or adjust icon dimensions and positions.

Lina: Plan the pictures of different guides and references in a way that automated processing of them is possible.

Lina: Create a script which finds all non-automatically reproducable screenshots and lists them to be replaced manually. Provide information about how to reproduce non trivial screenshots.

Contributors of this sheet
--------------------------

Alex: @Alexander Nitsche (Slack)
Lina: @linawolf (Slack)
