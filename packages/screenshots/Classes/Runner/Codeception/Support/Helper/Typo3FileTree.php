<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Runner\Codeception\Support\Helper;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

/**
 * Helper to support comfortable navigation of the TYPO3 file tree.
 */
class Typo3FileTree extends AbstractTypo3Tree
{
    protected string $treeFrameSelector = '#typo3-filestoragetree';
    protected string $treeToolbarSelector = '#filestoragetree-toolbar';
    protected string $treeSelector = '#typo3-filestoragetree .navigation-tree-container';
    protected string $treeSvgSelector = '#typo3-filestoragetree-tree';
    protected string $nodeSelector = 'g.nodes > .node';
    protected string $nodeAnchorSelector = 'text.node-name';

    /**
     * Scroll the file tree up to show the given node at the top.
     *
     * Make sure that the node is visible in the browser window before using this action. Otherwise, the browser
     * cannot determine the position of the node because the tree is an SVG element and the browser has limited
     * capabilities with respect to SVGs.
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollFileTreeTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        parent::scrollTreeTo($toSelector, $offsetX, $offsetY);
    }

    /**
     * Move the file tree of the main frame to top.
     */
    public function scrollFileTreeToTop(): void
    {
        parent::scrollTreeToTop();
    }

    /**
     * Move the file tree of the main frame to the bottom.
     */
    public function scrollFileTreeToBottom(): void
    {
        parent::scrollTreeToBottom();
    }

    public function _getFileTreeToolbarHeight(): int
    {
        return parent::getTreeToolbarHeight();
    }

    public function _getFileTreeScrollHeight(): int
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
     * Example to open "fileadmin/form_definitions" folder:
     * [
     *    'fileadmin',
     *    'form_definitions',
     * ]
     *
     * @param string[] $path
     * @throws \Codeception\Exception\ModuleException
     */
    public function openFileTreePath(array $path): void
    {
        parent::openTreePath($path);
    }
}
