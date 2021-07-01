/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

define(['jquery', 'jquery/autocomplete', 'TYPO3/CMS/Backend/Input/Clearable'], function ($) {

  var ScreenshotsManager = {};

  ScreenshotsManager.updateCopyButtonLabel = function() {
    let numImagesToCopy = $('.images-to-copy').filter(':checked').length;
    let numTextFilesToCopy = $('.text-files-to-copy').filter(':checked').length;
    let label = TYPO3.lang['button.copyscreenshots'].replace('%d', numImagesToCopy).replace('%d', numTextFilesToCopy);
    $('.button-copy-screenshots').text(label);
  };

  ScreenshotsManager.toggleAllImagesToCopy = function() {
    let checked = $('#toggleImagesToCopy').prop('checked');
    $('.images-to-copy').prop('checked', checked);
  }

  ScreenshotsManager.toggleAllTextFilesToCopy = function() {
    let checked = $('#toggleTextFilesToCopy').prop('checked');
    $('.text-files-to-copy').prop('checked', checked);
  }

  ScreenshotsManager.makeInputFieldClearable = function(selector) {
    const $inputField = $(selector);
    if ($inputField.length > 0) {
      $inputField[0].clearable({
        onClear: function (input) {
          input.closest('form').submit();
        }
      });
    }
  }

  ScreenshotsManager.addAutocompleteToSearchBox = function() {
    const $searchBox = $('#screenshotsSearch');
    if ($searchBox.length > 0) {
      $.ajax({
        url: TYPO3.settings.ajaxUrls['screenshots_folders'],
        dataType: 'json',
        cache: false
      }).done(function(suggestions) {
        $searchBox.autocomplete({
          lookupLimit: 30,
          lookup: suggestions,
          noCache: true,
          width: '100%',
          appendTo: '#screenshotsSearchContainer .dropdown-menu',
          beforeRender: function (container) {
            container.attr('style', '');
            container.parent().addClass('show');
          },
          onHide: function (container) {
            container.parent().removeClass('show');
          },
        });
      });
    }
  }

  $(document).ready(function () {
    $('.images-to-copy').on('click', function(){
      ScreenshotsManager.updateCopyButtonLabel();
    });
    $('#toggleImagesToCopy').on('click', function(){
      ScreenshotsManager.toggleAllImagesToCopy();
      ScreenshotsManager.updateCopyButtonLabel();
    });
    $('.text-files-to-copy').on('click', function(){
      ScreenshotsManager.updateCopyButtonLabel();
    });
    $('#toggleTextFilesToCopy').on('click', function(){
      ScreenshotsManager.toggleAllTextFilesToCopy();
      ScreenshotsManager.updateCopyButtonLabel();
    });
    ScreenshotsManager.makeInputFieldClearable('#screenshotsSearch');
    ScreenshotsManager.addAutocompleteToSearchBox();
  });

});
