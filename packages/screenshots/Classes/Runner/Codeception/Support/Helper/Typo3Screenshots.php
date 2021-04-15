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
use TYPO3\CMS\Screenshots\Runner\Configuration\Configuration;

/**
 * Helper to provide screenshots of TYPO3 specific backend elements.
 */
class Typo3Screenshots extends Module
{
    protected $config = [
        'basePath' => '',
        'imagePath' => 'Images/AutomaticScreenshots'
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

    public function setScreenshotsBasePath(string $basePath): void
    {
        $this->_setConfig(['basePath' => $basePath]);
    }

    public function cleanUpScreenshotsBasePath(): void
    {
        $this->cleanUpPath($this->_getConfig('basePath'));
    }

    public function setScreenshotsImagePath(string $imagePath): void
    {
        $this->_setConfig(['imagePath' => $imagePath]);
    }

    public function makeScreenshotOfWindow(string $fileName): void
    {
        $this->makeScreenshotOfElement($fileName);
    }

    public function makeScreenshotOfTable(int $pid, string $table, string $fileName, string $selector = ''): void
    {
        $this->goToTable($pid, $table);
        $this->makeScreenshotOfElement($fileName, $selector);
    }

    public function goToTable(int $pid, string $table): void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&id=%s&table=%s&imagemode=1',
            urlencode('/module/web/list'), $pid, $table)
        );
    }

    public function makeScreenshotOfRecord(string $table, int $uid, string $fileName, string $selector = ''): void
    {
        $this->goToRecord($table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector);
    }

    public function goToRecord(string $table, int $uid):void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit',
            urlencode('/record/edit'), $table, $uid
        ));
    }

    public function makeScreenshotOfField(string $table, int $uid, string $fields, string $fileName, string $selector = ''): void
    {
        $this->goToField($table, $uid, $fields);
        $this->makeScreenshotOfElement($fileName, $selector);
    }

    public function goToField(string $table, int $uid, string $fields): void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit&columnsOnly=%s',
            urlencode('/record/edit'), $table, $uid, $fields
        ));
    }

    protected function makeScreenshotOfElement(string $fileName, string $selector = ''): void
    {
        $relativePath = $this->getRelativePath($fileName);
        $tmpFileName = $this->getTemporaryFileName($relativePath);
        $tmpFilePath = $this->getTemporaryPath($tmpFileName);
        $actualFilePath = $this->getActualPath($relativePath);

        if (!empty($selector)) {
            $this->getModule('WebDriver')->makeElementScreenshot($selector, $tmpFileName);
        } else {
            $this->getModule('WebDriver')->makeScreenshot($tmpFileName);
        }

        @mkdir(dirname($actualFilePath), 0777, true);
        copy($tmpFilePath, $actualFilePath);
    }

    protected function getRelativePath(string $fileName): string
    {
        return $this->_getConfig('imagePath') . DIRECTORY_SEPARATOR . $fileName;
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

    protected function getActualPath(string $relativePath): string
    {
        return $this->_getConfig('basePath') . DIRECTORY_SEPARATOR . $relativePath . '.png';
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
}
