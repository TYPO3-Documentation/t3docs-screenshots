/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

define(['jquery'], function ($) {

  $(document).ready(function () {
    $('.smjs-toggle-all').on('click', function(){
      let selector = $(this).data('toggle-selector');
      let checked = $(this).prop('checked');
      $(selector).prop('checked', checked);
    });
  });

});
