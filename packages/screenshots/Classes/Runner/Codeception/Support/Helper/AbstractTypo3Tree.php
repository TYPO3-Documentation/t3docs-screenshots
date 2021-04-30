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
 * Helper to support comfortable navigation of the TYPO3 trees.
 */
abstract class AbstractTypo3Tree extends Module
{
    protected string $treeFrameSelector;
    protected string $treeToolbarSelector;
    protected string $treeSelector;
    protected string $treeSvgSelector;
    protected string $nodeSelector;
    protected string $nodeAnchorSelector;

    /**
     * Scroll the tree up to show the given node at the top.
     *
     * Make sure that the node is visible in the browser window before using this action. Otherwise, the browser
     * cannot determine the position of the node because the tree is an SVG element and the browser has limited
     * capabilities with respect to SVGs.
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    protected function scrollTreeTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $frameSelector = ['css' => $this->treeSvgSelector];
        $offsetY = $offsetY + $this->getTreeToolbarHeight() + $this->getTypo3Navigation()->_getHeaderHeight() + 3;
        $this->getTypo3Navigation()->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
    }

    /**
     * Move the tree of the main frame to top.
     */
    protected function scrollTreeToTop(): void
    {
        $frameSelector = ['css' => $this->treeSvgSelector];
        $this->getTypo3Navigation()->_scrollFrameToTop($frameSelector);
    }

    /**
     * Move the tree of the main frame to the bottom.
     */
    protected function scrollTreeToBottom(): void
    {
        $frameSelector = ['css' => $this->treeSvgSelector];
        $this->getTypo3Navigation()->_scrollFrameToBottom($frameSelector);
    }

    protected function getTreeToolbarHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['css' => $this->treeToolbarSelector]);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    protected function getTreeScrollHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['css' => $this->treeSvgSelector]);
        if (count($elements) > 0) {
            return $this->getWebDriver()->executeJS("return arguments[0].scrollHeight", $elements);
        }
        return 0;
    }

    /**
     * Open the given hierarchical path in the tree and click the last node.
     *
     * Make sure that the nodes of the hierarchical path are visible in the browser window before using this action.
     * Otherwise, the browser cannot find all nodes of the path because the tree is an SVG element and
     * the browser has limited capabilities with respect to SVGs.
     *
     * @param string[] $path
     * @throws \Codeception\Exception\ModuleException
     */
    protected function openTreePath(array $path): void
    {
        $this->getTypo3Navigation()->switchToMainFrame();

        $webDriver = $this->getWebDriver();
        $webDriver->seeElement(['css' => $this->treeSelector]);
        $tree = $webDriver->_findElements(['css' => $this->treeSelector])[0];
        foreach ($path as $nodeName) {
            $tree = $this->ensureTreeNodeIsOpen($nodeName, $tree);
        }
        $tree->findElement(WebDriverBy::cssSelector($this->nodeAnchorSelector))->click();
    }

    /**
     * Search for a node in the provided tree and open it.
     *
     * @param string $nodeText
     * @param RemoteWebElement $tree
     * @return RemoteWebElement
     * @throws \Codeception\Exception\ModuleException
     */
    protected function ensureTreeNodeIsOpen(string $nodeText, RemoteWebElement $tree): RemoteWebElement
    {
        $webDriver = $this->getWebDriver();
        $webDriver->see($nodeText, $this->nodeSelector);
        $node = $tree->findElement(WebDriverBy::xpath('//*[text()=\'' . $nodeText . '\']/..'));
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
