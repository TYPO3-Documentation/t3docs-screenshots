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
use TYPO3\CMS\Screenshots\Util\JsonHelper;

/**
 * Helper to highlight DOM elements for screenshots.
 *
 * This class relies on jQuery, which is provided by the TYPO3 backend by default.
 */
class Typo3Draw extends Module
{
    public const POSITION_LEFT = 'left';
    public const POSITION_RIGHT = 'right';
    public const POSITION_TOP = 'top';
    public const POSITION_BOTTOM = 'bottom';
    public const POSITION_LEFT_TOP = 'left-top';
    public const POSITION_LEFT_MIDDLE = 'left-middle';
    public const POSITION_LEFT_BOTTOM = 'left-bottom';
    public const POSITION_CENTER_TOP = 'center-top';
    public const POSITION_CENTER_BOTTOM = 'center-bottom';
    public const POSITION_RIGHT_TOP = 'right-top';
    public const POSITION_RIGHT_MIDDLE = 'right-middle';
    public const POSITION_RIGHT_BOTTOM = 'right-bottom';

    /**
     * @var string[]
     */
    protected array $paneCss = [
        "position" => "absolute",
        "top" => 0,
        "left" => 0,
        "z-index" => 1011,
        "pointer-events" => "none",
    ];

    /**
     * Draw a box around a DOM element specified by the selector.
     *
     * @param string $selector The DOM element,
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

        $elements = $this->findElementsOrThrowException($selector);

        $js = <<<'NOWDOC'
let pane=$('#t3docs-screenshots-pane');
if (pane.length === 0) {
    pane=$('<div id="t3docs-screenshots-pane">').css(%s).appendTo('body');
}

let elements=arguments;
for (let i = 0; i < elements.length; i++) {
    let element=$(elements[i]);
    let box=$('<div class="t3docs-screenshots-element">').css(%s);
    box.width(element.outerWidth());
    box.height(element.outerHeight());
    box.offset({
        left: element.offset().left - parseInt(box.css('border-left-width')),
        top: element.offset().top - parseInt(box.css('border-top-width'))
    });
    box.appendTo(pane);
}
NOWDOC;

        $this->getWebDriver()->executeJS(
            sprintf($js, JsonHelper::printInlineJson($this->paneCss), JsonHelper::printInlineJson($boxCss)),
            $elements
        );
    }

    protected function findElementsOrThrowException(string $selector): array
    {
        $elements = $this->getWebDriver()->_findElements($selector);
        if (count($elements) === 0) {
            throw new \Exception(sprintf('No element found for "%s".', $selector), 4003);
        }
        return $elements;
    }

    /**
     * Draw an arrow which points to a DOM element specified by the selector.
     *
     * @param string $selector The DOM element,
     *                          e.g. "#dashboard" to draw an arrow which points to the button "Dashboard" of the TYPO3
     *                          modules menu.
     * @param string $position The position of the arrow regarding the element it points to: "left-top", "left-middle",
     *                          "left-bottom", "center-top", "center-bottom", "right-top", "right-middle",
     *                          "right-bottom".
     */
    public function drawArrow(string $selector, string $position = self::POSITION_RIGHT_TOP): void
    {
        if (!$this->isValidArrowPosition($position)) {
            throw new \Exception(sprintf('Arrow position "%s" is invalid.', $position), 4001);
        }

        $arrowCss = [
            "position" => "absolute",
            "padding-left" => "10px",
            "transform-origin" => "left center",
        ];
        $arrowSvg = <<<'NOWDOC'
<svg width="126.93" height="32" version="1.1" viewBox="0 0 33.584 8.4667" xmlns="http://www.w3.org/2000/svg">
 <g transform="translate(48.542 -18.356)">
  <path fill="#F49700" d="m-14.958 21.828v1.5251c0 0.25164-0.20196 0.45752-0.44879 0.45752h-28.535v2.5545c0 0.40796-0.48245 0.61003-0.76669 0.32408l-3.7025-3.7746c-0.17578-0.1792-0.17578-0.46896 0-0.64816l3.7025-3.7746c0.28424-0.28976 0.76669-0.08388 0.76669 0.32408v2.5545h28.535c0.24684 0 0.44879 0.20588 0.44879 0.45752z"/>
 </g>
</svg>
NOWDOC;

        $elements = $this->findElementsOrThrowException($selector);
        $arrowSvgOneLine = str_replace("\n", "", $arrowSvg);
        [$positionX, $positionY] = explode('-', $position);

        $js = <<<'NOWDOC'
let pane=$('#t3docs-screenshots-pane');
if (pane.length === 0) {
    pane=$('<div id="t3docs-screenshots-pane">').css(%s).appendTo('body');
}

let elements=arguments;
for (let i = 0; i < elements.length; i++) {
    let element=$(elements[i]);
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
}
NOWDOC;

        $this->getWebDriver()->executeJS(
            sprintf(
                $js,
                JsonHelper::printInlineJson($this->paneCss),
                JsonHelper::printInlineJson($arrowCss),
                $arrowSvgOneLine,
                $positionX,
                $positionY,
                $position
            ),
            $elements
        );
    }

    protected function isValidArrowPosition(string $position): bool
    {
        return in_array($position, [
            self::POSITION_LEFT_TOP,
            self::POSITION_LEFT_MIDDLE,
            self::POSITION_LEFT_BOTTOM,
            self::POSITION_CENTER_TOP,
            self::POSITION_CENTER_BOTTOM,
            self::POSITION_RIGHT_TOP,
            self::POSITION_RIGHT_MIDDLE,
            self::POSITION_RIGHT_BOTTOM,
        ]);
    }

    /**
     * Draw a badge with text next to a DOM element specified by the selector.
     *
     * @param string $selector The DOM element,
     *                          e.g. "#dashboard" to add a badge next to the button "Dashboard" of the TYPO3 modules
     *                          menu.
     * @param string $label The badge text, e.g. "Click here" or "#1".
     * @param string $position The position of the badge regarding the element: "left", "top", "right" or "bottom".
     */
    public function drawBadge(string $selector, string $label, string $position = self::POSITION_BOTTOM): void
    {
        if (!$this->isValidBadgePosition($position)) {
            throw new \Exception(sprintf('Badge position "%s" is invalid.', $position), 4002);
        }

        $badgeCss = [
            "position" => "absolute",
            "font-size" => "larger",
            "color" => "white",
            "white-space" => "nowrap",
            "background-color" => "#F49700",
            "border-radius" => "2px",
            "padding" => "4px 10px 4px 10px",
        ];

        $elements = $this->findElementsOrThrowException($selector);

        $js = <<<'NOWDOC'
let pane=$('#t3docs-screenshots-pane');
if (pane.length === 0) {
    pane=$('<div id="t3docs-screenshots-pane">').css(%s).appendTo('body');
}

let elements=arguments;
let position="%s";
for (let i = 0; i < elements.length; i++) {
    let element=$(elements[i]);
    let badge = $('<div class="t3docs-screenshots-element">').text('%s').css(%s).appendTo(pane);
    let positions={
        "left": [
            Math.floor(element.offset().left - badge.outerWidth()),
            Math.floor(element.offset().top + element.outerHeight()/2 - badge.outerHeight()/2)
        ],
        "right": [
            Math.ceil(element.offset().left + element.outerWidth()),
            Math.floor(element.offset().top + element.outerHeight()/2 - badge.outerHeight()/2)
        ],
        "top": [
            Math.floor(element.offset().left + element.outerWidth()/2 - badge.outerWidth()/2),
            Math.floor(element.offset().top - badge.outerHeight())
        ],
        "bottom": [
            Math.floor(element.offset().left + element.outerWidth()/2 - badge.outerWidth()/2),
            Math.floor(element.offset().top +  element.outerHeight())
        ],
    };
    badge.css({
        left: positions[position][0],
        top: positions[position][1],
    });
}
NOWDOC;

        $this->getWebDriver()->executeJS(
            sprintf(
                $js,
                JsonHelper::printInlineJson($this->paneCss),
                $position,
                $label,
                JsonHelper::printInlineJson($badgeCss)
            ),
            $elements
        );
    }

    protected function isValidBadgePosition(string $position): bool
    {
        return in_array($position, [
            self::POSITION_LEFT,
            self::POSITION_RIGHT,
            self::POSITION_TOP,
            self::POSITION_BOTTOM,
        ]);
    }

    /**
     * Clear all drawings.
     */
    public function clearDrawings(): void
    {
        $typo3Navigation = $this->getTypo3Navigation();

        if ($typo3Navigation->_isOnInstallationProcessPage()) {
            $this->clearDrawingsOfInstallationProcess();
        } else {
            $this->clearDrawingsOfBackend();
        }
    }

    /**
     * Clear all drawings of the TYPO3 installation process.
     */
    protected function clearDrawingsOfInstallationProcess(): void
    {
        $this->clearDrawingsOfIFrame();
    }

    /**
     * Clear all drawings of the TYPO3 backend.
     */
    protected function clearDrawingsOfBackend(): void
    {
        $typo3Navigation = $this->getTypo3Navigation();

        if ($typo3Navigation->_isOnMainFrame()) {
            $this->clearDrawingsOfIFrame();
            $typo3Navigation->switchToContentFrame();
            $this->clearDrawingsOfIFrame();
            $typo3Navigation->switchToMainFrame();
        } else {
            $this->clearDrawingsOfIFrame();
            if ($typo3Navigation->_hasMainFrame()) {
                $typo3Navigation->switchToMainFrame();
                $this->clearDrawingsOfIFrame();
                $typo3Navigation->switchToContentFrame();
            }
        }
    }

    protected function clearDrawingsOfIFrame(): void
    {
        $js = <<<'NOWDOC'
let pane=$('#t3docs-screenshots-pane');
if (pane.length > 0) {
    pane.remove();
}
NOWDOC;

        $webDriver = $this->getWebDriver();
        $webDriver->executeJS($js);
    }

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }

    public function getTypo3Navigation(): Typo3Navigation
    {
        return $this->getModule(Typo3Navigation::class);
    }
}
