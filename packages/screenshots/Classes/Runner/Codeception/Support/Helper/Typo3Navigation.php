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

use Codeception\Module;
use Codeception\Module\WebDriver;
use Facebook\WebDriver\WebDriverElement;
use TYPO3\TestingFramework\Core\Acceptance\Helper\Login;

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
    protected $config = [
        'defaults' => [],
    ];

    public function setNavigationDefaultTable(string $table): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['defaults' => array_merge($this->_getConfig('defaults'), ['table' => $table])]));
    }

    public function setNavigationDefaultUid(int $uid): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['defaults' => array_merge($this->_getConfig('defaults'), ['uid' => $uid])]));
    }

    public function clearNavigationDefaults(): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['defaults' => []]));
    }

    public function resetNavigationConfig(): void
    {
        $this->_resetConfig();
    }

    /**
     * Navigate back to the TYPO3 installation process from any url.
     */
    public function reloadInstallationProcess(): void
    {
        $this->getWebDriver()->amOnPage('/');
        $this->getWebDriver()->waitForText('Installing TYPO3 CMS', 5);
    }

    /**
     * Navigate back to the TYPO3 backend from any url.
     *
     * @param string $role
     */
    public function reloadBackend(string $role = ''): void
    {
        $this->getLogin()->useExistingSession($role);
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

    public function _isOnInstallationProcessPage(): bool
    {
        return count($this->getWebDriver()->_findElements(".install-tool-installer")) > 0;
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
     * @return int[]
     */
    public function _getFullPageSize(): array
    {
        if ($this->_isOnInstallationProcessPage()) {
            return $this->getFullPageSizeOfInstallationProcess();
        } else {
            return $this->getFullPageSizeOfBackend();
        }
    }

    /**
     * Calculate the total page size of the TYPO3 installation process.
     *
     * The total page height is the container height plus twice the Y position of the container.
     *
     * @return int[]
     */
    protected function getFullPageSizeOfInstallationProcess(): array
    {
        $windowSize = $this->_getWindowSize();
        $windowInnerSize = $this->_getWindowInnerSize();

        $pageHeight = $this->_getInstallationProcessPageHeight();

        $fullPageWidth = $windowSize['width'];
        $fullPageHeight = ($windowSize['height'] - $windowInnerSize['height']) + $pageHeight;

        return [
            'width' => $fullPageWidth,
            'height' => $fullPageHeight
        ];
    }

    /**
     * Calculate the total page size of the TYPO3 backend.
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
    protected function getFullPageSizeOfBackend(): array
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

    public function _getInstallationProcessPageHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['class' => 'typo3-install-container']);
        if (count($elements) > 0) {
            return 2 * $elements[0]->getLocation()->getY() + $elements[0]->getSize()->getHeight();
        }
        return 0;
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

    /**
     * Set specified CSS properties of a DOM element.
     *
     * Note: Use this action with caution, as it can interfere with the natural behavior of a website. This action was
     * introduced to neatly position elements on a drawing pane, which are normally dragged and dropped by the user.
     *
     * ``` php
     * <?php
     * $I->setCssOfElement('#drag', ['left' => '10px', 'top' => '100px']);
     * ?>
     * ```
     *
     * @param string $selector
     * @param array $css
     * @return void
     */
    public function setCssOfElement(string $selector, array $css): void
    {
        $element = $this->getWebDriver()->_findElements($selector)[0];
        foreach ($css as $propertyName => $value) {
            $this->getWebDriver()->executeJS("arguments[0].style.$propertyName = \"$value\"", [$element]);
        }
    }

    /**
     * Navigate directly to a TYPO3 backend record form.
     *
     * @param string $table
     * @param int $uid
     * @throws \Exception
     */
    public function goToRecord(string $table = '', int $uid = -1): void
    {
        if (!$this->_isOnMainFrame() && $this->_hasMainFrame()) {
            $this->switchToMainFrame();
        }
        [$table, $uid] = $this->resolveRecord($table, $uid);
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/record/edit?edit[%s][%s]=edit&token=x',
            $table, $uid
        ));
        $this->scrollModuleBodyToTop();
    }

    /**
     * Navigate directly to a TYPO3 backend module
     *
     * @param string $module
     * @param array $pageTree
     * @param string $subModule
     * @throws \Exception
     */
    public function goToModule(string $module = 'List', array $path = [], string $subModule = ''): void
    {
        if (!$this->_hasMainFrame()) {
            $this->reloadBackend();
        }
        if (!$this->_isOnMainFrame() && $this->_hasMainFrame()) {
            $this->switchToMainFrame();
        }
        $this->getWebDriver()->see($module);
        $this->getWebDriver()->click($module);
        if ($path !== []) {
            $this->getTypo3PageTree()->openPageTreePath($path);
        }
        $this->switchToContentFrame();
        if ($subModule !== '') {
            $this->getWebDriver()->selectOption('select.t3-js-jumpMenuBox', $subModule);
        }
        $this->scrollModuleBodyToTop();
    }

    protected function resolveRecord(string $table, int $uid): array
    {
        $table = $table !== '' ? $table : $this->_getConfig('defaults')['table'];
        $uid = $uid !== -1 ? $uid : $this->_getConfig('defaults')['uid'];
        if ($table === null || $uid === null) {
            throw new \Exception(
                'Record cannot be resolved: Set table name and UID explicitly or specify default values.',
                4002
            );
        }
        $this->debug(sprintf('Use record with UID "%s" of table "%s".', $uid, $table));
        return [$table, $uid];
    }

    /**
     * Navigate directly to a TYPO3 backend record form with specific fields only.
     *
     * @param string $fields
     * @param string $table
     * @param int $uid
     * @throws \Exception
     */
    public function goToField(string $fields, string $table = '', int $uid = -1): void
    {
        if (!$this->_isOnMainFrame() && $this->_hasMainFrame()) {
            $this->switchToMainFrame();
        }
        [$table, $uid] = $this->resolveRecord($table, $uid);
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/record/edit?edit[%s][%s]=edit&columnsOnly=%s&token=x',
            $table, $uid, $fields
        ));
        $this->scrollModuleBodyToTop();
    }

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }

    protected function getTypo3PageTree(): Typo3PageTree
    {
        return $this->getModule(Typo3PageTree::class);
    }

    protected function getTypo3FileTree(): Typo3FileTree
    {
        return $this->getModule(Typo3FileTree::class);
    }

    protected function getLogin(): Login
    {
        return $this->getModule(Login::class);
    }
}
