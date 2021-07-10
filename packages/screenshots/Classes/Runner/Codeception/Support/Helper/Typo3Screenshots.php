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
use TYPO3\CMS\Screenshots\Util\FileHelper;
use TYPO3\CMS\Screenshots\Util\StringHelper;

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
    ];

    public function setScreenshotsBasePath(string $path): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['basePath' => $path]));
    }

    public function setScreenshotsDocumentationPath(string $path): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['documentationPath' => $path]));
    }

    public function setScreenshotsImagePath(string $path): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['imagePath' => $path]));
    }

    public function setScreenshotsRstPath(string $path): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['rstPath' => $path]));
    }

    public function createScreenshotsRstFile(bool $create): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['createRstFile' => $create]));
    }

    public function fetchScreenshotsPathFilter(): string
    {
        $pathFilter = $this->_getConfig('pathFilter');
        if (!empty($pathFilter)) {
            $this->debug(sprintf('Only run screenshots.json of folder "%s".', $pathFilter));
        }
        return $pathFilter;
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

    public function resetScreenshotsConfig(): void
    {
        $this->_resetConfig();
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
     * Take screenshot of a TYPO3 backend records table form.
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
        $this->getTypo3Navigation()->goToTable($pid, $table);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $captionText, $captionReference);
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
        $this->getTypo3Navigation()->goToRecord($table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $captionText, $captionReference);
    }

    /**
     * Take screenshot of a TYPO3 backend record form with specific fields only.
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
        $this->getTypo3Navigation()->goToField($fields, $table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $captionText, $captionReference);
    }

    /**
     * Take screenshot of the browser window or of a DOM element - if $selector is specified.
     *
     * Also use this action to take a screenshot of only the TYPO3 backend content frame with:
     * ``` php
     * <?php
     * $I->makeScreenshotOfElement("Typo3ContentFrameOnly", "#typo3-contentIframe");
     * ?>
     * ```
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
        return FileHelper::getPathBySegments($this->_getConfig('imagePath'), $fileName . '.png');
    }

    protected function getTemporaryFileName(string $relativePath): string
    {
        $pathInfo = pathinfo($relativePath);
        return $pathInfo['filename'] . '_' . substr(md5($relativePath), 0, 8);
    }

    protected function getTemporaryPath(string $fileName): string
    {
        return FileHelper::getPathBySegments(codecept_log_dir() . 'debug', $fileName . '.png');
    }

    protected function getAbsoluteDocumentationPath(string $relativePath): string
    {
        return FileHelper::getPathBySegments(
            $this->_getConfig('basePath'),
            $this->_getConfig('documentationPath'),
            $relativePath
        );
    }

    protected function makeRstFile(string $fileName, string $relativeImagePath, string $altText = '', string $captionText = '', string $captionReference = ''): void
    {
        $relativeRstPath = $this->getRelativeRstPath($fileName);
        $absoluteRstPath = $this->getAbsoluteDocumentationPath($relativeRstPath);

        $options = [];
        if ($altText !== '') {
            $options[] = sprintf(':alt: %s', $altText);
        }
        $options[] = ':class: with-shadow';
        $options = StringHelper::indentMultilineText(implode("\n", $options), '   ');

        $rst = <<<'NOWDOC'
.. Automatic screenshot: Remove this line if you want to manually change this file

.. figure:: /%s
%s
NOWDOC;

        $rst = sprintf($rst, $relativeImagePath, $options);

        $caption = $this->getRstCaption($captionText, $captionReference);
        if ($caption !== '') {
            $rst .= sprintf("\n\n   %s", $caption);
        }

        @mkdir(dirname($absoluteRstPath), 0777, true);
        file_put_contents($absoluteRstPath, $rst);
    }

    protected function getRelativeRstPath(string $fileName): string
    {
        return FileHelper::getPathBySegments($this->_getConfig('rstPath'), $fileName . '.rst.txt');
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
