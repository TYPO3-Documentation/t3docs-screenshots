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
use Facebook\WebDriver\Exception\ElementNotInteractableException;
use Facebook\WebDriver\Exception\NoSuchElementException;
use Facebook\WebDriver\Remote\RemoteWebElement;
use Facebook\WebDriver\WebDriverBy;
use Facebook\WebDriver\WebDriverElement;

/**
 * Helper to support comfortable navigation of the TYPO3 page tree.
 *
 * This helper contains a slightly adapted copy of class AbstractPageTree of the typo3/testing-framework package.
 * It should be integrated there ideally. Currently it differs by:
 * - adding the actions to the actor instead of providing an own class
 *   to prevent additional injections in testing classes
 * - considering the configuration param "wait" of module "WebDriver"
 *   when opening the page tree path and the page tree is not visible immediately
 *
 * @see \TYPO3\TestingFramework\Core\Acceptance\Helper\AbstractPageTree
 */
class Typo3PageTree extends Module
{
    // Selectors
    protected string $pageTreeFrameSelector = '#typo3-pagetree';
    protected string $pageTreeSelector = '#typo3-pagetree-treeContainer';
    protected string $treeItemSelector = 'g.nodes > .node';
    protected string $treeItemAnchorSelector = 'text.node-name';

    /**
     * Scroll the page tree up to show the given element at the top.
     *
     * Make sure that the element is visible in the browser window before using this action. Otherwise, the browser
     * cannot determine the position of the element because the page tree is an SVG element and the browser has limited
     * capabilities with respect to SVGs.
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
        $frameSelector = ['id' => 'typo3-pagetree-tree'];
        $offsetY = $offsetY + $this->_getPageTreeToolbarHeight() + $this->getTypo3Navigation()->_getHeaderHeight() + 3;
        $this->getTypo3Navigation()->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
    }

    public function _getPageTreeToolbarHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['id' => 'typo3-pagetree-toolbar']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    public function _getPageTreeScrollHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['id' => 'typo3-pagetree-tree']);
        if (count($elements) > 0) {
            return $this->getWebDriver()->executeJS("return arguments[0].scrollHeight", $elements);
        }
        return 0;
    }

    /**
     * Move the page tree of the main frame to top.
     */
    public function scrollPageTreeToTop(): void
    {
        $frameSelector = ['id' => 'typo3-pagetree-tree'];
        $this->getTypo3Navigation()->_scrollFrameToTop($frameSelector);
    }

    /**
     * Move the page tree of the main frame to the bottom.
     */
    public function scrollPageTreeToBottom(): void
    {
        $frameSelector = ['id' => 'typo3-pagetree-tree'];
        $this->getTypo3Navigation()->_scrollFrameToBottom($frameSelector);
    }

    /**
     * Open the given hierarchical path in the page tree and click the last page.
     *
     * Make sure that the pages of the hierarchical path are visible in the browser window before using this action.
     * Otherwise, the browser cannot find all page nodes of the path because the page tree is an SVG element and
     * the browser has limited capabilities with respect to SVGs.
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
        $this->getTypo3Navigation()->switchToMainFrame();

        $webDriver = $this->getWebDriver();
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

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }

    protected function getTypo3Navigation(): Typo3Navigation
    {
        return $this->getModule(Typo3Navigation::class);
    }
}
