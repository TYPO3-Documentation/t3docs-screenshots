<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Runner\Codeception\Support\Helper;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Codeception\Module;
use Codeception\Module\WebDriver;

/**
 * Helper to highlight DOM elements for screenshots.
 */
class Typo3Draw extends Module
{
    /**
     * @var string[]
     */
    protected array $paneCss = [
        "position" => "absolute",
        "top" => 0,
        "left" => 0,
        "z-index" => 1001,
    ];

    /**
     * Draw a box around a DOM element specified by the selector.
     *
     * @param string $selector The DOM element selector used by jQuery(selector),
     *                          e.g. "#dashboard" to draw a box around the button "Dashboard" of the TYPO3 modules menu.
     */
    public function drawBox(string $selector): void
    {
        $boxCss = [
            "position" => "absolute",
            "box-sizing" => "border-box",
            "border-style" => "solid",
            "border-color" => "#F49700",
            "border-width" => "2px",
            "border-radius" => "2px",
        ];

        /** @var WebDriver $webDriver */
        $webDriver = $this->getModule('WebDriver');
        $webDriver->executeJS(sprintf(<<<HEREDOC
let pane=$('#t3docs-screenshots-pane');
if (pane.length === 0) {
    pane=$('<div id="t3docs-screenshots-pane">').css(%s).appendTo('body');
}

let selector="%s";
let element=$(selector);
if (element.length > 0) {
    let box=$('<div class="t3docs-screenshots-element">').css(%s);
    box.width(element.outerWidth());
    box.height(element.outerHeight());
    box.offset({
        left: element.offset().left - parseInt(box.css('border-left-width')),
        top: element.offset().top - parseInt(box.css('border-top-width'))
    });
    box.appendTo(pane);
} else {
    throw 'No element found for "' + selector + '".';
}
HEREDOC, json_encode($this->paneCss), $selector, json_encode($boxCss)));
    }

    /**
     * Clear all drawings.
     */
    public function clearDrawings(): void
    {
        /** @var WebDriver $webDriver */
        $webDriver = $this->getModule('WebDriver');
        $webDriver->executeJS(<<<HEREDOC
let pane=$('#t3docs-screenshots-pane');
if (pane.length > 0) {
    pane.remove();
}
HEREDOC);
    }
}
