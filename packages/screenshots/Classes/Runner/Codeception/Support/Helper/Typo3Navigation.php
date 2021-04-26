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

use Codeception\Exception\MalformedLocatorException;
use Codeception\Module;
use Codeception\Module\WebDriver;
use Codeception\Util\Locator;
use Facebook\WebDriver\Exception\ElementNotInteractableException;
use Facebook\WebDriver\Exception\NoSuchElementException;
use Facebook\WebDriver\Remote\RemoteWebDriver;
use Facebook\WebDriver\Remote\RemoteWebElement;
use Facebook\WebDriver\WebDriverBy;

/**
 * Helper to support comfortable navigation of the TYPO3 backend.
 *
 * This helper contains a slightly adapted copy of class AbstractPageTree of the typo3/testing-framework package.
 * It should be integrated there ideally. Currently it differs by:
 * - adding the actions to the actor instead of providing an own class
 *   to prevent additional injections in testing classes
 * - considering the configuration param "wait" of module "WebDriver"
 *   when opening the page tree path and the page tree is not visible immediately
 *
 * This helper contains a slightly adapted copy of trait FrameSteps of the typo3/testing-framework package.
 * It should be integrated there ideally. Currently it differs by:
 * - it is a helper class, not an actor trait, and therefore can be used by other helper classes
 * - element position calculation has changed in TYPO3 v11
 *
 * @see \TYPO3\TestingFramework\Core\Acceptance\Helper\AbstractPageTree
 */
class Typo3Navigation extends Module
{
    // Selectors
    protected string $pageTreeFrameSelector = '#typo3-pagetree';
    protected string $pageTreeSelector = '#typo3-pagetree-treeContainer';
    protected string $treeItemSelector = 'g.nodes > .node';
    protected string $treeItemAnchorSelector = 'text.node-name';

    /**
     * Switch to TYPO3 backend main frame, the one with module menu and top bar.
     */
    public function switchToMainFrame(): void
    {
        $webDriver = $this->getWebDriver();
        $webDriver->waitForElementNotVisible('#nprogress', 120);
        $webDriver->switchToIFrame();
    }

    /**
     * Switch to TYPO3 backend content frame, the one with module content.
     */
    public function switchToContentFrame(): void
    {
        $webDriver = $this->getWebDriver();
        $webDriver->waitForElementNotVisible('#nprogress', 120);
        $webDriver->switchToIFrame('list_frame');
        $webDriver->waitForElementNotVisible('#nprogress', 120);
    }

    public function _isOnMainFrame(): bool
    {
        $webDriver = $this->getWebDriver();
        $contentFrame = $webDriver->_findElements("iframe[name='list_frame']");
        return count($contentFrame) > 0;
    }

    /**
     * Scroll the module menu up to show the given element at the top.
     *
     * ``` php
     * <?php
     * $I->scrollModuleMenuTo('#file');
     * ?>
     * ```
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollModuleMenuTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $scrollingElement = 'document.getElementsByClassName("scaffold-modulemenu")[0]';
        $offsetY = $offsetY + $this->getHeaderHeight() + 5;
        $this->scrollFrameTo($scrollingElement, $toSelector, $offsetX, $offsetY);
    }

    protected function getHeaderHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['class' => 'scaffold-header']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    /**
     * Move the module menu of the main frame to top.
     */
    public function scrollModuleMenuToTop(): void
    {
        $scrollingElement = 'document.getElementsByClassName("scaffold-modulemenu")[0]';
        $this->scrollFrameToTop($scrollingElement);
    }

    /**
     * Move the module menu of the main frame to the bottom.
     */
    public function scrollModuleMenuToBottom(): void
    {
        $scrollingElement = 'document.getElementsByClassName("scaffold-modulemenu")[0]';
        $this->scrollFrameToBottom($scrollingElement);
    }

    /**
     * Scroll the page tree up to show the given element at the top.
     *
     * ``` php
     * <?php
     * $I->scrollPageTreeTo('.node.identifier-0_32');
     * ?>
     * ```
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollPageTreeTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $scrollingElement = 'document.getElementById("typo3-pagetree-tree")';
        $offsetY = $offsetY + $this->getPageTreeToolbarHeight() + $this->getHeaderHeight() + 3;
        $this->scrollFrameTo($scrollingElement, $toSelector, $offsetX, $offsetY);
    }

    protected function getPageTreeToolbarHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['id' => 'typo3-pagetree-toolbar']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    /**
     * Move the page tree of the main frame to top.
     */
    public function scrollPageTreeToTop(): void
    {
        $scrollingElement = 'document.getElementById("typo3-pagetree-tree")';
        $this->scrollFrameToTop($scrollingElement);
    }

    /**
     * Move the page tree of the main frame to the bottom.
     */
    public function scrollPageTreeToBottom(): void
    {
        $scrollingElement = 'document.getElementById("typo3-pagetree-tree")';
        $this->scrollFrameToBottom($scrollingElement);
    }

    /**
     * Scroll the module body up to show the given element at the top.
     *
     * ``` php
     * <?php
     * $I->scrollModuleBodyTo('#t3-table-tx_styleguide_elements_rte');
     * ?>
     * ```
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollModuleBodyTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $scrollingElement = 'document.getElementsByClassName("module")[0]';
        $offsetY = $offsetY + $this->getModuleHeaderHeight() + 10;
        $this->scrollFrameTo($scrollingElement, $toSelector, $offsetX, $offsetY);
    }

    protected function getModuleHeaderHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['class' => 'module-docheader']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    /**
     * Move the module body of the content frame to top.
     */
    public function scrollModuleBodyToTop(): void
    {
        $scrollingElement = 'document.getElementsByClassName("module")[0]';
        $this->scrollFrameToTop($scrollingElement);
    }

    /**
     * Move the module body of the content frame to the bottom.
     */
    public function scrollModuleBodyToBottom(): void
    {
        $scrollingElement = 'document.getElementsByClassName("module")[0]';
        $this->scrollFrameToBottom($scrollingElement);
    }

    /**
     * Scroll the TYPO3 backend frame (module menu, page tree, module body) up to show the given element at the top.
     * Extra shift can be set by passing $offsetX and $offsetY parameters.
     *
     * The scrolling layer gets scrolled up first to ease the position calculation of the element.
     *
     * @param string $scrollingElement
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     * @return void
     *
     * @see \Codeception\Module\WebDriver::scrollTo
     */
    protected function scrollFrameTo(string $scrollingElement, string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $this->getWebDriver()->executeInSelenium(
            function (RemoteWebDriver $webDriver) use ($scrollingElement, $toSelector, $offsetX, $offsetY) {
                $webDriver->executeScript( "$scrollingElement.scrollTop = 0");
                $el = $webDriver->findElement($this->getLocator($toSelector));
                $x = $el->getLocation()->getX() - $offsetX;
                $y = $el->getLocation()->getY() - $offsetY;
                $webDriver->executeScript( "$scrollingElement.scrollTo($x, $y)");
            }
        );
    }

    /**
     * Scroll the TYPO3 backend frame to top.
     *
     * @param string $scrollingElement
     * @return void
     */
    protected function scrollFrameToTop(string $scrollingElement): void
    {
        $this->getWebDriver()->executeInSelenium(
            function (RemoteWebDriver $webDriver) use ($scrollingElement) {
                $webDriver->executeScript("$scrollingElement.scrollTop = 0");
            }
        );
    }

    /**
     * Scroll the TYPO3 backend frame to the bottom.
     *
     * @param string $scrollingElement
     * @return void
     */
    protected function scrollFrameToBottom(string $scrollingElement): void
    {
        $this->getWebDriver()->executeInSelenium(
            function (RemoteWebDriver $webDriver) use ($scrollingElement) {
                $webDriver->executeScript("$scrollingElement.scrollTop = $scrollingElement.scrollHeight");
            }
        );
    }

    /**
     * Open the given hierarchical path in the page tree and click the last page.
     *
     * Example to open "styleguide -> elements basic" page:
     * [
     *    'styleguide TCA demo',
     *    'elements basic',
     * ]
     *
     * @param string[] $path
     * @throws \Codeception\Exception\ModuleException
     */
    public function openPageTreePath(array $path): void
    {
        $webDriver = $this->getWebDriver();
        $webDriver->switchToIFrame();
        $webDriver->seeElement(['css' => $this->pageTreeSelector]);
        $pageTree = $webDriver->_findElements(['css' => $this->pageTreeSelector])[0];
        foreach ($path as $pageName) {
            $pageTree = $this->ensureTreeNodeIsOpen($pageName, $pageTree);
        }
        $pageTree->findElement(WebDriverBy::cssSelector($this->treeItemAnchorSelector))->click();
    }

    /**
     * Search for a page node in the provided page tree and open it.
     *
     * @param string $nodeText
     * @param RemoteWebElement $pageTree
     * @return RemoteWebElement
     * @throws \Codeception\Exception\ModuleException
     */
    protected function ensureTreeNodeIsOpen(string $nodeText, RemoteWebElement $pageTree): RemoteWebElement
    {
        $webDriver = $this->getWebDriver();
        $webDriver->see($nodeText, $this->treeItemSelector);
        $node = $pageTree->findElement(WebDriverBy::xpath('//*[text()=\'' . $nodeText . '\']/..'));
        try {
            $node->findElement(WebDriverBy::cssSelector('.chevron.collapsed'))->click();
        } catch (NoSuchElementException $e) {
            // element not found so it may be already opened...
        } catch (ElementNotInteractableException $e) {
            // another possible exception if the chevron isn't there ... depends on facebook driver version
        }
        return $node;
    }

    /**
     * Clone of the WebDriver module method which is unfortunately declared protected.
     *
     * @param $selector
     * @return WebDriverBy
     * @throws \InvalidArgumentException
     *
     * @see \Codeception\Module\WebDriver::getLocator()
     */
    protected function getLocator($selector)
    {
        if ($selector instanceof WebDriverBy) {
            return $selector;
        }
        if (is_array($selector)) {
            return $this->getStrictLocator($selector);
        }
        if (Locator::isID($selector)) {
            return WebDriverBy::id(substr($selector, 1));
        }
        if (Locator::isCSS($selector)) {
            return WebDriverBy::cssSelector($selector);
        }
        if (Locator::isXPath($selector)) {
            return WebDriverBy::xpath($selector);
        }
        throw new \InvalidArgumentException("Only CSS or XPath allowed");
    }

    /**
     * Clone of the WebDriver module method which is unfortunately declared protected.
     *
     * @param array $by
     * @return WebDriverBy
     *
     * @see \Codeception\Module\WebDriver::getStrictLocator()
     */
    protected function getStrictLocator(array $by)
    {
        $type = key($by);
        $locator = $by[$type];
        switch ($type) {
            case 'id':
                return WebDriverBy::id($locator);
            case 'name':
                return WebDriverBy::name($locator);
            case 'css':
                return WebDriverBy::cssSelector($locator);
            case 'xpath':
                return WebDriverBy::xpath($locator);
            case 'link':
                return WebDriverBy::linkText($locator);
            case 'class':
                return WebDriverBy::className($locator);
            default:
                throw new MalformedLocatorException(
                    "$by => $locator",
                    "Strict locator can be either xpath, css, id, link, class, name: "
                );
        }
    }

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }
}
