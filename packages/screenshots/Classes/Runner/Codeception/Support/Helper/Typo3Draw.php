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
    public const ARROW_LEFT_TOP = 'left-top';
    public const ARROW_LEFT_MIDDLE = 'left-middle';
    public const ARROW_LEFT_BOTTOM = 'left-bottom';
    public const ARROW_CENTER_TOP = 'center-top';
    public const ARROW_CENTER_BOTTOM = 'center-bottom';
    public const ARROW_RIGHT_TOP = 'right-top';
    public const ARROW_RIGHT_MIDDLE = 'right-middle';
    public const ARROW_RIGHT_BOTTOM = 'right-bottom';

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
     * Draw an arrow which points to a DOM element specified by the selector.
     *
     * @param string $selector The DOM element selector used by jQuery(selector),
     *                          e.g. "#dashboard" to draw an arrow which points to the button "Dashboard" of the TYPO3
     *                          modules menu.
     * @param string $position The position of the arrow regarding the element it points to: "left-top", "left-middle",
     *                          "left-bottom", "center-top", "center-bottom", "right-top", "right-middle",
     *                          "right-bottom".
     */
    public function drawArrow(string $selector, string $position = self::ARROW_RIGHT_TOP): void
    {
        if (!$this->isValidArrowPosition($position)) {
            throw new \Exception(sprintf('Arrow position "%s" is invalid.', $position), 4001);
        }

        $arrowCss = [
            "position" => "absolute",
            "padding-left" => "10px",
            "transform-origin" => "left center",
        ];
        $arrowSvg = <<<HEREDOC
<svg width="126.93" height="32" version="1.1" viewBox="0 0 33.584 8.4667" xmlns="http://www.w3.org/2000/svg">
 <g transform="translate(48.542 -18.356)">
  <path fill="#F49700" d="m-14.958 21.828v1.5251c0 0.25164-0.20196 0.45752-0.44879 0.45752h-28.535v2.5545c0 0.40796-0.48245 0.61003-0.76669 0.32408l-3.7025-3.7746c-0.17578-0.1792-0.17578-0.46896 0-0.64816l3.7025-3.7746c0.28424-0.28976 0.76669-0.08388 0.76669 0.32408v2.5545h28.535c0.24684 0 0.44879 0.20588 0.44879 0.45752z"/>
 </g>
</svg>
HEREDOC;
        $arrowSvgOneLine = str_replace("\n", "", $arrowSvg);
        [$positionX, $positionY] = explode('-', $position);

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
    let arrow=$('<div class="t3docs-screenshots-element">').css(%s).html('%s').appendTo(pane);
    let position={
        "left": element.offset().left,
        "center": element.offset().left + Math.ceil(element.outerWidth()/2),
        "right": element.offset().left + element.outerWidth(),
        "top": element.offset().top - Math.ceil(arrow.height()/2),
        "middle": element.offset().top + Math.ceil(element.outerHeight()/2) - Math.ceil(arrow.height()/2),
        "bottom": element.offset().top + element.outerHeight() - Math.ceil(arrow.height()/2),
    };
    let angle={
        "left-top": "225deg",
        "left-middle": "180deg",
        "left-bottom": "135deg",
        "center-top": "270deg",
        "center-bottom": "90deg",
        "right-top": "315deg",
        "right-middle": "0deg",
        "right-bottom": "45deg",
    };
    arrow.css({
        "transform": "translate("+position['%s']+"px, "+position['%s']+"px) rotate("+angle['%s']+")",
    });
} else {
    throw 'No element found for "' + selector + '".';
}
HEREDOC, json_encode($this->paneCss), $selector, json_encode($arrowCss), $arrowSvgOneLine, $positionX, $positionY, $position));
    }

    protected function isValidArrowPosition(string $position): bool
    {
        return in_array($position, [
            self::ARROW_LEFT_TOP,
            self::ARROW_LEFT_MIDDLE,
            self::ARROW_LEFT_BOTTOM,
            self::ARROW_CENTER_TOP,
            self::ARROW_CENTER_BOTTOM,
            self::ARROW_RIGHT_TOP,
            self::ARROW_RIGHT_MIDDLE,
            self::ARROW_RIGHT_BOTTOM,
        ]);
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
