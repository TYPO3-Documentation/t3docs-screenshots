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
     * @param string $fileName
     * @param string $altText
     * @param string $captionText
     * @param string $captionReference
     */
    public function makeScreenshotOfFullPage(string $fileName, string $altText = '', string $captionText = '', string $captionReference = ''): void
    {
        $webDriver = $this->getWebDriver();
        $typo3Navigation = $this->getTypo3Navigation();

        $windowSize = $typo3Navigation->_getWindowSize();
        $fullPageSize = $typo3Navigation->_getFullPageSize();

        $webDriver->resizeWindow($fullPageSize['width'], $fullPageSize['height']);
        $this->makeScreenshotOfWindow($fileName, $altText, $captionText, $captionReference);
        $webDriver->resizeWindow($windowSize['width'], $windowSize['height']);
    }

    /**
     * Take screenshot of the browser window.
     *
     * @param string $fileName
     * @param string $altText
     * @param string $captionText
     * @param string $captionReference
     */
    public function makeScreenshotOfWindow(string $fileName, string $altText = '', string $captionText = '', string $captionReference = ''): void
    {
        $this->makeScreenshotOfElement($fileName, '', $altText, $captionText, $captionReference);
    }

    /**
     * Take screenshot of a TYPO3 backend table form.
     *
     * Attention: If the screenshot looks broken, resize the window to full page before taking the screenshot.
     * Therefore, replace this action with:
     * ``` php
     * <?php
     * $I->goToTable(..);
     * $I->resizeToFullPage();
     * $I->makeScreenshotOfElement(..);
     * $I->resizeWindow(..);
     * ?>
     * ```
     * This issue is due to a chrome driver bug with partially scrolled out DOM elements.
     * See https://bugs.chromium.org/p/chromedriver/issues/detail?id=3629 for further details.
     *
     * @param string $fileName
     * @param int $pid
     * @param string $table
     * @param string $selector
     * @param string $altText
     * @param string $captionText
     * @param string $captionReference
     */
    public function makeScreenshotOfTable(string $fileName, int $pid = -1, string $table = '', string $selector = '', string $altText = '', string $captionText = '', string $captionReference = ''): void
    {
        $this->goToTable($pid, $table);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $captionText, $captionReference);
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

    /**
     * Take screenshot of a TYPO3 backend record form.
     *
     * Attention: If the screenshot looks broken, resize the window to full page before taking the screenshot.
     * Therefore, replace this action with:
     * ``` php
     * <?php
     * $I->goToRecord(..);
     * $I->resizeToFullPage();
     * $I->makeScreenshotOfElement(..);
     * $I->resizeWindow(..);
     * ?>
     * ```
     * This issue is due to a chrome driver bug with partially scrolled out DOM elements.
     * See https://bugs.chromium.org/p/chromedriver/issues/detail?id=3629 for further details.
     *
     * @param string $fileName
     * @param string $table
     * @param int $uid
     * @param string $selector
     * @param string $altText
     * @param string $captionText
     * @param string $captionReference
     */
    public function makeScreenshotOfRecord(string $fileName, string $table = '', int $uid = -1, string $selector = '', string $altText = '', string $captionText = '', string $captionReference = ''): void
    {
        $this->goToRecord($table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $captionText, $captionReference);
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

    /**
     * Take screenshot of a TYPO3 backend form field.
     *
     * Attention: If the screenshot looks broken, resize the window to full page before taking the screenshot.
     * Therefore, replace this action with:
     * ``` php
     * <?php
     * $I->goToField(..);
     * $I->resizeToFullPage();
     * $I->makeScreenshotOfElement(..);
     * $I->resizeWindow(..);
     * ?>
     * ```
     * This issue is due to a chrome driver bug with partially scrolled out DOM elements.
     * See https://bugs.chromium.org/p/chromedriver/issues/detail?id=3629 for further details.
     *
     * @param string $fileName
     * @param string $fields
     * @param string $table
     * @param int $uid
     * @param string $selector
     * @param string $altText
     * @param string $captionText
     * @param string $captionReference
     */
    public function makeScreenshotOfField(string $fileName, string $fields, string $table = '', int $uid = -1, string $selector = '.form-section', string $altText = '', string $captionText = '', string $captionReference = ''): void
    {
        $this->goToField($fields, $table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $captionText, $captionReference);
    }

    public function goToField(string $fields, string $table = '', int $uid = -1): void
    {
        [$table, $uid] = $this->resolveRecord($table, $uid);
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit&columnsOnly=%s',
            urlencode('/record/edit'), $table, $uid, $fields
        ));
    }

    /**
     * Take screenshot of the browser window or of a DOM element - if $selector is specified.
     *
     * Attention: If the screenshot of a DOM element looks broken, resize the window to full page before taking the
     * screenshot. Therefore, replace this action with:
     * ``` php
     * <?php
     * $I->resizeToFullPage();
     * $I->makeScreenshotOfElement(..);
     * $I->resizeWindow(..);
     * ?>
     * ```
     * This is due to a chrome driver bug with partially scrolled out DOM elements.
     * See https://bugs.chromium.org/p/chromedriver/issues/detail?id=3629 for further details.
     *
     * @param string $fileName
     * @param string $selector
     * @param string $altText
     * @param string $captionText
     * @param string $captionReference
     */
    public function makeScreenshotOfElement(string $fileName, string $selector = '', string $altText = '', string $captionText = '', string $captionReference = ''): void
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
            $this->makeRstFile($fileName, $relativeImagePath, $altText, $captionText, $captionReference);
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
        if ($this->_getConfig('basePath') !== '') {
            $absolutePath[] = $this->_getConfig('basePath');
        }
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

    protected function makeRstFile(string $fileName, string $relativeImagePath, string $altText = '', string $captionText = '', string $captionReference = ''): void
    {
        $relativeRstPath = $this->getRelativeRstPath($fileName);
        $absoluteRstPath = $this->getAbsoluteDocumentationPath($relativeRstPath);
        $caption = $this->getRstCaption($captionText, $captionReference);

        $rst = <<<'NOWDOC'
.. Automatic screenshot: Remove this line if you want to manually change this file

.. figure:: /%s
   :alt: %s
   :class: with-shadow
NOWDOC;

        $rst = sprintf($rst, $relativeImagePath, $altText);
        if ($caption !== '') {
            $rst .= sprintf("\n\n   %s", $caption);
        }

        @mkdir(dirname($absoluteRstPath), 0777, true);
        file_put_contents($absoluteRstPath, $rst);
    }

    protected function getRelativeRstPath(string $fileName): string
    {
        return $this->_getConfig('rstPath') . DIRECTORY_SEPARATOR . $fileName . '.rst.txt';
    }

    protected function getRstCaption(string $captionText = '', string $captionReference = ''): string
    {
        if (!empty($captionReference) && !empty($captionText)) {
            return sprintf(':ref:`%s <%s>`', $captionText, $captionReference);
        } elseif (!empty($captionText)) {
            return $captionText;
        } else {
            return '';
        }
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
