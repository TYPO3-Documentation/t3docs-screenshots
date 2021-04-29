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
use TYPO3\CMS\Screenshots\Configuration\Configuration;

/**
 * Helper to provide screenshots of TYPO3 specific backend elements.
 */
class Typo3Screenshots extends Module
{
    protected $config = [
        'actionsIdFilter' => '',
        'basePath' => '',
        'documentationPath' => 'Documentation',
        'imagePath' => 'Images/AutomaticScreenshots',
        'rstPath' => 'Images/Rst',
        'createRstFile' => true,
        'defaults' => [],
    ];

    /**
     * @param string $path Path to the folder that might contain the screenshots.json.
     * @return bool Does the folder contain the screenshots.json?
     */
    public function checkForScreenshotsConfiguration(string $path): bool
    {
        $configuration = new Configuration($path);
        return is_file($configuration->getFilePath());
    }

    /**
     * @param string $path Path to the folder that contains the screenshots.json.
     * @return Configuration
     */
    public function loadScreenshotsConfiguration(string $path): Configuration
    {
        $configuration = new Configuration($path);
        $configuration->read();
        return $configuration;
    }

    public function setScreenshotsBasePath(string $path): void
    {
        $this->_setConfig(['basePath' => $path]);
    }

    public function cleanUpScreenshotsBasePath(): void
    {
        $this->cleanUpPath($this->_getConfig('basePath'));
    }

    public function setScreenshotsDocumentationPath(string $path): void
    {
        $this->_setConfig(['documentationPath' => $path]);
    }

    public function setScreenshotsImagePath(string $path): void
    {
        $this->_setConfig(['imagePath' => $path]);
    }

    public function setScreenshotsRstPath(string $path): void
    {
        $this->_setConfig(['rstPath' => $path]);
    }

    public function createScreenshotsRstFile(bool $create): void
    {
        $this->_setConfig(['createRstFile' => $create]);
    }

    public function setScreenshotsDefaultPid(int $pid): void
    {
        $this->_setConfig(['defaults' => array_merge($this->_getConfig('defaults'), ['pid' => $pid])]);
    }

    public function setScreenshotsDefaultTable(string $table): void
    {
        $this->_setConfig(['defaults' => array_merge($this->_getConfig('defaults'), ['table' => $table])]);
    }

    public function setScreenshotsDefaultUid(int $uid): void
    {
        $this->_setConfig(['defaults' => array_merge($this->_getConfig('defaults'), ['uid' => $uid])]);
    }

    public function clearScreenshotsDefaults(): void
    {
        $this->_setConfig(['defaults' => []]);
    }

    public function fetchScreenshotsActionsIdFilter(): string
    {
        $actionsIdFilter = $this->_getConfig('actionsIdFilter');
        $actionsIdFilter = is_numeric($actionsIdFilter) ? '' : $actionsIdFilter;
        if (!empty($actionsIdFilter)) {
            $this->debug(sprintf('Only run actions with identifier "%s".', $actionsIdFilter));
        }
        return $actionsIdFilter;
    }

    /**
     * Save current browser window size, set size to full page, take screenshot and reset size to saved window size.
     *
     * The total page height is the header height plus the maximum of the three columns:
     * - module menu
     * - page tree
     * - module
     *
     * Since the module is in a different frame than the rest, this action switches between frames to capture all sizes
     * and returns to the frame where it started.
     * Also, this method adjusts the outer dimension of the browser, but calculates the inner dimension: so it must
     * calculate the distance between the two types of dimensions.
     *
     * @param string $fileName
     * @param string $altText
     * @param string $refLabel
     * @param string $refTitle
     */
    public function makeScreenshotOfFullPage(string $fileName, string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $webDriver = $this->getWebDriver();
        $typo3Navigation = $this->getTypo3Navigation();

        $windowWidth = $typo3Navigation->_getWindowWidth();
        $windowHeight = $typo3Navigation->_getWindowHeight();

        $scrollHeights = [];
        if ($typo3Navigation->_isOnMainFrame()) {
            $windowInnerHeight = $typo3Navigation->_getWindowInnerHeight();
            $headerHeight = $typo3Navigation->_getHeaderHeight();
            $scrollHeights[] = $typo3Navigation->_getModuleMenuScrollHeight();
            $scrollHeights[] = $typo3Navigation->_getPageTreeToolbarHeight() + $typo3Navigation->_getPageTreeScrollHeight();
            $typo3Navigation->switchToContentFrame();
            $scrollHeights[] = $typo3Navigation->_getModuleScrollHeight();
            $typo3Navigation->switchToMainFrame();
        } else {
            $scrollHeights[] = $typo3Navigation->_getModuleScrollHeight();
            $typo3Navigation->switchToMainFrame();
            $windowInnerHeight = $typo3Navigation->_getWindowInnerHeight();
            $headerHeight = $typo3Navigation->_getHeaderHeight();
            $scrollHeights[] = $typo3Navigation->_getModuleMenuScrollHeight();
            $scrollHeights[] = $typo3Navigation->_getPageTreeToolbarHeight() + $typo3Navigation->_getPageTreeScrollHeight();
            $typo3Navigation->switchToContentFrame();
        }

        $fullPageWidth = $windowWidth;
        $fullPageHeight = ($windowHeight - $windowInnerHeight) + $headerHeight + max($scrollHeights);

        $webDriver->resizeWindow($fullPageWidth, $fullPageHeight);
        $this->makeScreenshotOfWindow($fileName, $altText, $refLabel, $refTitle);
        $webDriver->resizeWindow($windowWidth, $windowHeight);
    }

    public function makeScreenshotOfWindow(string $fileName, string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->makeScreenshotOfElement($fileName, '', $altText, $refLabel, $refTitle);
    }

    public function makeScreenshotOfTable(string $fileName, int $pid = -1, string $table = '', string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->goToTable($pid, $table);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToTable(int $pid = -1, string $table = ''): void
    {
        [$pid, $table] = $this->resolveTable($pid, $table);
        $this->getWebDriver()->amOnPage(sprintf(
                '/typo3/index.php?route=%s&token=1&id=%s&table=%s&imagemode=1',
                urlencode('/module/web/list'), $pid, $table)
        );
    }

    protected function resolveTable(int $pid, string $table): array
    {
        $pid = $pid !== -1 ? $pid : $this->_getConfig('defaults')['pid'];
        $table = $table !== '' ? $table : $this->_getConfig('defaults')['table'];
        if ($pid === null || $table === null) {
            throw new \Exception(
                'Table cannot be resolved: Set table name and PID explicitly or specify default values.',
                4001
            );
        }
        $this->debug(sprintf('Use table "%s" of PID "%s".', $table, $pid));
        return [$pid, $table];
    }

    public function makeScreenshotOfRecord(string $fileName, string $table = '', int $uid = -1, string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->goToRecord($table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToRecord(string $table = '', int $uid = -1): void
    {
        [$table, $uid] = $this->resolveRecord($table, $uid);
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit',
            urlencode('/record/edit'), $table, $uid
        ));
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

    public function makeScreenshotOfField(string $fileName, string $fields, string $table = '', int $uid = -1, string $selector = '.form-section', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->goToField($fields, $table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToField(string $fields, string $table = '', int $uid = -1): void
    {
        [$table, $uid] = $this->resolveRecord($table, $uid);
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit&columnsOnly=%s',
            urlencode('/record/edit'), $table, $uid, $fields
        ));
    }

    public function makeScreenshotOfElement(string $fileName, string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $relativeImagePath = $this->getRelativeImagePath($fileName);
        $tmpFileName = $this->getTemporaryFileName($relativeImagePath);
        $tmpFilePath = $this->getTemporaryPath($tmpFileName);
        $absoluteImagePath = $this->getAbsoluteDocumentationPath($relativeImagePath);

        if (!empty($selector)) {
            $this->getWebDriver()->seeElement($selector);
            $this->getWebDriver()->makeElementScreenshot($selector, $tmpFileName);
        } else {
            $this->getWebDriver()->makeScreenshot($tmpFileName);
        }

        @mkdir(dirname($absoluteImagePath), 0777, true);
        copy($tmpFilePath, $absoluteImagePath);

        if ($this->_getConfig('createRstFile')) {
            $this->makeRstFile($fileName, $relativeImagePath, $altText, $refLabel, $refTitle);
        }
    }

    protected function getRelativeImagePath(string $fileName): string
    {
        return $this->_getConfig('imagePath') . DIRECTORY_SEPARATOR . $fileName . '.png';
    }

    protected function getTemporaryFileName(string $relativePath): string
    {
        $pathInfo = pathinfo($relativePath);
        return $pathInfo['filename'] . '_' . substr(md5($relativePath), 0, 8);
    }

    protected function getTemporaryPath(string $fileName): string
    {
        $path = codecept_log_dir() . 'debug';
        return $path . DIRECTORY_SEPARATOR . $fileName . '.png';
    }

    protected function getAbsoluteDocumentationPath(string $relativePath): string
    {
        $absolutePath = [];
        $absolutePath[] = $this->_getConfig('basePath');
        if ($this->_getConfig('documentationPath') !== '') {
            $absolutePath[] = $this->_getConfig('documentationPath');
        }
        $absolutePath[] = $relativePath;
        return implode(DIRECTORY_SEPARATOR, $absolutePath);
    }

    protected function cleanUpPath(string $path): void
    {
        if (is_dir($path)) {
            $subPaths = glob($path . '/*');
            foreach ($subPaths as $subPath) {
                if (is_file($subPath)) {
                    unlink($subPath);
                }
                if (is_dir($subPath)) {
                    $this->cleanUpPath($subPath);
                }
            }
            rmdir($path);
        }
    }

    protected function makeRstFile(string $fileName, string $relativeImagePath, string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $relativeRstPath = $this->getRelativeRstPath($fileName);
        $absoluteRstPath = $this->getAbsoluteDocumentationPath($relativeRstPath);
        $refDirective = $this->getRstReferenceDirective($refLabel, $refTitle);

        $rst = <<<HEREDOC
.. Automatic screenshot: Remove this line if you want to manually change this file

.. figure:: /$relativeImagePath
   :alt: $altText
   :class: with-shadow
HEREDOC;

        if ($refDirective !== '') {
            $rst .= sprintf("\n\n   %s", $refDirective);
        }

        @mkdir(dirname($absoluteRstPath), 0777, true);
        file_put_contents($absoluteRstPath, $rst);
    }

    protected function getRelativeRstPath(string $fileName): string
    {
        return $this->_getConfig('rstPath') . DIRECTORY_SEPARATOR . $fileName . '.rst.txt';
    }

    protected function getRstReferenceDirective(string $refLabel = '', string $refTitle = ''): string
    {
        if (!empty($refTitle) && !empty($refLabel)) {
            return sprintf(':ref:`%s <%s>`', $refTitle, $refLabel);
        } elseif (!empty($refLabel)) {
            return sprintf(':ref:`%s`', $refLabel);
        } else {
            return '';
        }
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
