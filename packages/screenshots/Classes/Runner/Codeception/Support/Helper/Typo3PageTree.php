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

/**
 * Helper to support comfortable navigation of the TYPO3 page tree.
 *
 * This helper contains a slightly adapted copy of class AbstractPageTree of the typo3/testing-framework package.
 * It should be integrated there ideally. Currently it differs by:
 * - adding the actions to the actor instead of providing an own class
 *   to prevent additional injections in testing classes
 * - considering the configuration param "wait" of module "WebDriver"
 *   when opening the page tree path and the page tree is not visible immediately
 * - waits 0.1s per page tree level before opening the next page tree node
 *   as the levels get loaded via AJAX
 *
 * @see \TYPO3\TestingFramework\Core\Acceptance\Helper\AbstractPageTree
 */
class Typo3PageTree extends AbstractTypo3Tree
{
    protected string $treeFrameSelector = '#typo3-pagetree';
    protected string $treeToolbarSelector = '#typo3-pagetree-toolbar';
    protected string $treeSelector = '#typo3-pagetree-treeContainer';
    protected string $treeSvgSelector = '#typo3-pagetree-tree';
    protected string $nodeSelector = 'g.nodes > .node';
    protected string $nodeAnchorSelector = 'text.node-name';

    /**
     * Scroll the page tree up to show the given node at the top.
     *
     * Make sure that the node is visible in the browser window before using this action. Otherwise, the browser
     * cannot determine the position of the node because the tree is an SVG element and the browser has limited
     * capabilities with respect to SVGs.
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollPageTreeTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        parent::scrollTreeTo($toSelector, $offsetX, $offsetY);
    }

    /**
     * Move the page tree of the main frame to top.
     */
    public function scrollPageTreeToTop(): void
    {
        parent::scrollTreeToTop();
    }

    /**
     * Move the page tree of the main frame to the bottom.
     */
    public function scrollPageTreeToBottom(): void
    {
        parent::scrollTreeToBottom();
    }

    public function _getPageTreeToolbarHeight(): int
    {
        return parent::getTreeToolbarHeight();
    }

    public function _getPageTreeScrollHeight(): int
    {
        return parent::getTreeScrollHeight();
    }

    /**
     * Open the given hierarchical path in the file tree and click the last node.
     *
     * Make sure that the nodes of the hierarchical path are visible in the browser window before using this action.
     * Otherwise, the browser cannot find all nodes of the path because the tree is an SVG element and
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
        parent::openTreePath($path);
    }
}
