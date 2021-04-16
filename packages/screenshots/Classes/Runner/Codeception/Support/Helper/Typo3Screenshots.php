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
        'documentationPath' => 'Documents',
        'imagePath' => 'Images/AutomaticScreenshots',
        'rstPath' => 'Images/Rst',
        'createRstFile' => true
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

    public function makeScreenshotOfWindow(string $fileName, string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->makeScreenshotOfElement($fileName, '', $altText, $refLabel, $refTitle);
    }

    public function makeScreenshotOfTable(int $pid, string $table, string $fileName, string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->goToTable($pid, $table);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToTable(int $pid, string $table): void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&id=%s&table=%s&imagemode=1',
            urlencode('/module/web/list'), $pid, $table)
        );
    }

    public function makeScreenshotOfRecord(string $table, int $uid, string $fileName, string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->goToRecord($table, $uid);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToRecord(string $table, int $uid):void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit',
            urlencode('/record/edit'), $table, $uid
        ));
    }

    public function makeScreenshotOfField(string $table, int $uid, string $fields, string $fileName, string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->goToField($table, $uid, $fields);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToField(string $table, int $uid, string $fields): void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit&columnsOnly=%s',
            urlencode('/record/edit'), $table, $uid, $fields
        ));
    }

    public function makeScreenshotOfElement(string $fileName, string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $relativeImagePath = $this->getRelativeImagePath($fileName);
        $tmpFileName = $this->getTemporaryFileName($relativeImagePath);
        $tmpFilePath = $this->getTemporaryPath($tmpFileName);
        $absoluteImagePath = $this->getAbsolutePath($relativeImagePath);

        if (!empty($selector)) {
            $this->getModule('WebDriver')->makeElementScreenshot($selector, $tmpFileName);
        } else {
            $this->getModule('WebDriver')->makeScreenshot($tmpFileName);
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

    protected function getAbsolutePath(string $relativePath): string
    {
        $absolutePath = [];
        $absolutePath[] = $this->_getConfig('basePath');
        if ($this->_getConfig('documentationPath') !== '') {
            $absolutePath[] .= $this->_getConfig('documentationPath');
        }
        $absolutePath[] .= $relativePath;
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
        $absoluteRstPath = $this->getAbsolutePath($relativeRstPath);
        $refDirective = $this->getRstReferenceDirective($refLabel, $refTitle);

        $rst = <<<HEREDOC
.. Automatic screenshot: Remove this line if you want to manually change this file

.. figure:: /$relativeImagePath
   :alt: $altText
   :class: with-shadow
HEREDOC;

        if ($refDirective !== '') {
            $rst .= sprintf("\n   %s", $refDirective);
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
}
