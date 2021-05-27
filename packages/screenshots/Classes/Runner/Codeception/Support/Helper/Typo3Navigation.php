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
use Facebook\WebDriver\WebDriverElement;

/**
 * Helper to support comfortable navigation of the TYPO3 backend.
 *
 * This helper contains a slightly adapted copy of trait FrameSteps of the typo3/testing-framework package.
 * It should be integrated there ideally. Currently it differs by:
 * - it is a helper class, not an actor trait, and therefore can be used by other helper classes
 * - element position calculation has changed in TYPO3 v11
 *
 * This helper contains a slightly adapted copy of class ModalDialog of the typo3/core package.
 * It should be integrated in the typo3/testing-framework ideally. Currently it differs by:
 * - adding the actions to the actor instead of providing an own class
 *   to prevent additional injections in testing classes
 *
 * @see \TYPO3\TestingFramework\Core\Acceptance\Helper\AbstractPageTree
 */
class Typo3Navigation extends Module
{
    // Selectors
    protected string $openedModalSelector = '.modal.show';
    protected string $openedModalButtonContainerSelector = '.modal.show .modal-footer';

    /**
     * Restart the browser with default configuration and navigate to the TYPO3 backend from any url.
     */
    public function restartBrowserAndLoadBackend(): void
    {
        $this->getWebDriver()->deleteSessionSnapshot('login');
        $this->getWebDriver()->_restart();
        $this->getTypo3Login()->useExistingSession('admin');
    }

    /**
     * Navigate back to the TYPO3 backend from any url.
     */
    public function reloadBackend(): void
    {
        $this->getTypo3Login()->useExistingSession('admin');
    }

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

    /**
     * Check if the browser is in the TYPO3 backend main frame, the one with module menu and top bar.
     *
     * @return bool
     */
    public function _isOnMainFrame(): bool
    {
        return count($this->getWebDriver()->_findElements("#modulemenu")) > 0;
    }

    /**
     * Check if there is a TYPO3 backend main frame.
     *
     * If the browser was navigated directly to an url of the TYPO3 backend content frame, the main frame does not exist
     * and switching to it would throw an exception.
     *
     * @return bool
     *
     * @see Typo3Screenshots::goToField() Example for navigating the browser to a content frame directly.
     */
    public function _hasMainFrame(): bool
    {
        return $this->getWebDriver()->executeJS('return self !== top');
    }

    /**
     * Resize the current window to total page size.
     *
     * Consider resizing the window back to its previous size when done with the full page actions.
     *
     * @see WebDriver::resizeWindow()
     */
    public function resizeToFullPage(): void
    {
        $windowSize = $this->_getWindowSize();
        $fullPageSize = $this->_getFullPageSize();

        $this->debug(sprintf(
            'Resizing browser window from %dx%d to %dx%d.',
            $windowSize['width'], $windowSize['height'], $fullPageSize['width'], $fullPageSize['height']
        ));

        $this->getWebDriver()->resizeWindow($fullPageSize['width'], $fullPageSize['height']);
    }

    /**
     * Calculate the total page size.
     *
     * The total page height is the header height plus the maximum of the three columns:
     * - module menu
     * - page tree / file tree
     * - module
     *
     * Since the module is in a different frame than the rest, this action switches between frames to capture all sizes
     * and returns to the frame where it started.
     * Also, this method calculates the outer dimension of the browser, but receives the inner dimension: so it must
     * calculate the distance between the two types of dimensions.
     *
     * @return int[]
     */
    public function _getFullPageSize(): array
    {
        $typo3PageTree = $this->getTypo3PageTree();
        $typo3FileTree = $this->getTypo3FileTree();

        $windowSize = $this->_getWindowSize();

        $scrollHeights = [];
        if ($this->_isOnMainFrame()) {
            $windowInnerSize = $this->_getWindowInnerSize();
            $headerHeight = $this->_getHeaderHeight();
            $scrollHeights[] = $this->_getModuleMenuScrollHeight();
            $scrollHeights[] = $typo3PageTree->_getPageTreeToolbarHeight() + $typo3PageTree->_getPageTreeScrollHeight();
            $scrollHeights[] = $typo3FileTree->_getFileTreeToolbarHeight() + $typo3FileTree->_getFileTreeScrollHeight();
            $this->switchToContentFrame();
            $scrollHeights[] = $this->_getModuleScrollHeight();
            $this->switchToMainFrame();
        } else {
            $scrollHeights[] = $this->_getModuleScrollHeight();
            if ($this->_hasMainFrame()) {
                $this->switchToMainFrame();
                $windowInnerSize = $this->_getWindowInnerSize();
                $headerHeight = $this->_getHeaderHeight();
                $scrollHeights[] = $this->_getModuleMenuScrollHeight();
                $scrollHeights[] = $typo3PageTree->_getPageTreeToolbarHeight() + $typo3PageTree->_getPageTreeScrollHeight();
                $scrollHeights[] = $typo3FileTree->_getFileTreeToolbarHeight() + $typo3FileTree->_getFileTreeScrollHeight();
                $this->switchToContentFrame();
            } else {
                $windowInnerSize = $this->_getWindowInnerSize();
                $headerHeight = 0;
            }
        }

        $fullPageWidth = $windowSize['width'];
        $fullPageHeight = ($windowSize['height'] - $windowInnerSize['height']) + $headerHeight + max($scrollHeights);

        return [
            'width' => $fullPageWidth,
            'height' => $fullPageHeight
        ];
    }

    /**
     * Return the window size of the main frame.
     *
     * @return int[]
     */
    public function _getWindowSize(): array
    {
        return [
            'width' => $this->getWebDriver()->webDriver->manage()->window()->getSize()->getWidth(),
            'height' => $this->getWebDriver()->webDriver->manage()->window()->getSize()->getHeight()
        ];
    }

    /**
     * Return the inner window size of the current frame(!)
     *
     * @return int[]
     */
    public function _getWindowInnerSize(): array
    {
        return [
            'width' => $this->getWebDriver()->executeJS('return window.innerWidth;'),
            'height' => $this->getWebDriver()->executeJS('return window.innerHeight;')
        ];
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
        $frameSelector = ['class' => 'scaffold-modulemenu'];
        $offsetY = $offsetY + $this->_getHeaderHeight() + 5;
        $this->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
    }

    public function _getHeaderHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['class' => 'scaffold-header']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    public function _getModuleMenuScrollHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['class' => 'scaffold-modulemenu']);
        if (count($elements) > 0) {
            return $this->getWebDriver()->executeJS("return arguments[0].scrollHeight", $elements);
        }
        return 0;
    }

    /**
     * Move the module menu of the main frame to top.
     */
    public function scrollModuleMenuToTop(): void
    {
        $frameSelector = ['class' => 'scaffold-modulemenu'];
        $this->_scrollFrameToTop($frameSelector);
    }

    /**
     * Move the module menu of the main frame to the bottom.
     */
    public function scrollModuleMenuToBottom(): void
    {
        $frameSelector = ['class' => 'scaffold-modulemenu'];
        $this->_scrollFrameToBottom($frameSelector);
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
        $frameSelector = ['class' => 'module'];
        $offsetY = $offsetY + $this->_getModuleHeaderHeight() + 10;
        $this->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
    }

    public function _getModuleHeaderHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['class' => 'module-docheader']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    public function _getModuleScrollHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['class' => 'module']);
        if (count($elements) > 0) {
            return $this->getWebDriver()->executeJS("return arguments[0].scrollHeight", $elements);
        }
        return 0;
    }

    /**
     * Move the module body of the content frame to top.
     */
    public function scrollModuleBodyToTop(): void
    {
        $frameSelector = ['class' => 'module'];
        $this->_scrollFrameToTop($frameSelector);
    }

    /**
     * Move the module body of the content frame to the bottom.
     */
    public function scrollModuleBodyToBottom(): void
    {
        $frameSelector = ['class' => 'module'];
        $this->_scrollFrameToBottom($frameSelector);
    }

    /**
     * Scroll the TYPO3 backend frame (module menu, page tree, module body) up to show the given element at the top.
     * Extra shift can be set by passing $offsetX and $offsetY parameters.
     *
     * The scrolling layer gets scrolled up first to ease the position calculation of the element.
     *
     * @param string|array $frameSelector
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     * @return void
     *
     * @see \Codeception\Module\WebDriver::scrollTo
     */
    public function _scrollFrameTo($frameSelector, string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $webDriver = $this->getWebDriver();

        /** @var WebDriverElement $frameElement */
        /** @var WebDriverElement $toElement */
        $frameElement = $webDriver->_findElements($frameSelector)[0];
        $toElement = $webDriver->_findElements($toSelector)[0];

        $frameElementScrollX = $webDriver->executeJS("return arguments[0].scrollLeft", [$frameElement]);
        $frameElementScrollY = $webDriver->executeJS("return arguments[0].scrollTop", [$frameElement]);
        $toElementX = $toElement->getLocation()->getX();
        $toElementY = $toElement->getLocation()->getY();
        $x = $frameElementScrollX + $toElementX - $offsetX;
        $y = $frameElementScrollY + $toElementY - $offsetY;

        $webDriver->executeJS("arguments[0].scrollTo($x, $y)", [$frameElement]);
    }

    /**
     * Scroll the TYPO3 backend frame to top.
     *
     * @param string|array $frameSelector
     * @return void
     */
    public function _scrollFrameToTop($frameSelector): void
    {
        $frameElement = $this->getWebDriver()->_findElements($frameSelector)[0];
        $this->getWebDriver()->executeJS("arguments[0].scrollTop = 0", [$frameElement]);
    }

    /**
     * Scroll the TYPO3 backend frame to the bottom.
     *
     * @param string|array $frameSelector
     * @return void
     */
    public function _scrollFrameToBottom($frameSelector): void
    {
        $frameElement = $this->getWebDriver()->_findElements($frameSelector)[0];
        $this->getWebDriver()->executeJS("arguments[0].scrollTop = arguments[0].scrollHeight", [$frameElement]);
    }

    public function waitForModalDialogInMainFrame(): void
    {
        $this->switchToMainFrame();

        $webDriver = $this->getWebDriver();
        $webDriver->waitForElement($this->openedModalSelector);
        $webDriver->wait(0.5);
    }

    public function clickButtonInModalDialog(string $buttonLink): void
    {
        $webDriver = $this->getWebDriver();
        $webDriver->click($buttonLink, $this->openedModalButtonContainerSelector);
        $webDriver->waitForElementNotVisible($this->openedModalSelector);
        $webDriver->wait(0.5);
    }

    public function waitForAndClickModalDialogInMainFrame(string $buttonLink): void
    {
        $this->waitForModalDialogInMainFrame();
        $this->clickButtonInModalDialog($buttonLink);
    }

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }

    public function getTypo3PageTree(): Typo3PageTree
    {
        return $this->getModule(Typo3PageTree::class);
    }

    public function getTypo3FileTree(): Typo3FileTree
    {
        return $this->getModule(Typo3FileTree::class);
    }

    protected function getTypo3Login(): Typo3Login
    {
        return $this->getModule(Typo3Login::class);
    }
}
