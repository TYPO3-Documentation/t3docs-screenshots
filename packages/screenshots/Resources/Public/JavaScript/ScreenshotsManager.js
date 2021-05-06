/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

define(['jquery'], function ($) {

  var ScreenshotsManager = {};

  ScreenshotsManager.updateCopyButtonLabel = function() {
    let numImagesToCopy = $('.images-to-copy').filter(':checked').length;
    let numFilesToCopy = $('#screenshotsNumFiles').val();
    let label = TYPO3.lang['button.copyscreenshots'].replace('%d', numImagesToCopy).replace('%d', numFilesToCopy);
    $('.button-copy-screenshots').attr('value', label);
  };

  ScreenshotsManager.toggleAllImagesToCopy = function() {
    let checked = $('#toggleImagesToCopy').prop('checked');
    $('.images-to-copy').prop('checked', checked);
  }

  $(document).ready(function () {
    $('.images-to-copy').on('click', function(){
      ScreenshotsManager.updateCopyButtonLabel();
    });
    $('#toggleImagesToCopy').on('click', function(){
      ScreenshotsManager.toggleAllImagesToCopy();
      ScreenshotsManager.updateCopyButtonLabel();
    });
  });

});
