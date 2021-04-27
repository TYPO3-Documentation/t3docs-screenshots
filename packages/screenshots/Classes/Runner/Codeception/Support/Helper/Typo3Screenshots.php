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
use TYPO3\CMS\Core\Utility\GeneralUtility;
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
        'currentRecord' => [
            'table' => 'pages',
            'uid' => 1
        ],
        'fileNameDefault' => '###TABLE###',
        'fileNameDefaultField' => '###TABLE###_###FIELD###',
        'fileNameSchema' => 'UpperCamelCase',
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

    public function setScreenshotsFileNameDefault(string $name): void
    {
        $this->_setConfig(['fileNameDefault' => $name]);
    }

    public function setScreenshotsFileNameDefaultField(string $name): void
    {
        $this->_setConfig(['fileNameDefaultField' => $name]);
    }

    /**
     * UpperCamelCase: Transfer filenames from underline to UpperCamelCase
     * LowerCamelCase: Transfer filenames from underline to lowerCamelCase
     * All other values: Leave filenames unchanged
     * @param string $schema one of "UpperCamelCase", "LowerCamelCase", ""
     * @throws \Codeception\Exception\ModuleConfigException
     * @throws \Codeception\Exception\ModuleException
     */
    public function setScreenshotsFileNameSchema(string $schema): void
    {
        $this->_setConfig(['fileNameSchema' => $schema]);
    }

    public function setScreenshotsBasePath(string $path): void
    {
        $this->_setConfig(['basePath' => $path]);
    }

    /**
     * Sets a default value for table and uid when no explicit ones are used in
     * the call.
     *
     * Example:
     * {
     *    "action": "setScreenshotsCurrentRecord",
     *    "table": "tx_styleguide_elements_basic",
     *    "uid": {
     *        "action": "getUidByField",
     *        "table": "tx_styleguide_elements_basic",
     *        "field": "sys_language_uid",
     *        "value": 0
     *    }
     * },
     * // Takes screenshots from the record choosen above and field "inpu_1"
     * {
     *    "action": "makeScreenshotOfField",
     *    "fields": "input_1"
     * },
     *
     * @param string $table
     * @param int $uid
     * @throws \Codeception\Exception\ModuleConfigException
     * @throws \Codeception\Exception\ModuleException
     */
    public function setScreenshotsCurrentRecord(string $table, int $uid): void
    {
        $record = [
            'table' => $table,
            'uid' => $uid
        ];
        $this->_setConfig(['currentRecord' => $record]);
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

    public function fetchScreenshotsActionsIdFilter(): string
    {
        $actionsIdFilter = $this->_getConfig('actionsIdFilter');
        $actionsIdFilter = is_numeric($actionsIdFilter) ? '' : $actionsIdFilter;
        if (!empty($actionsIdFilter)) {
            $this->debug(sprintf('Only run actions with identifier "%s".', $actionsIdFilter));
        }
        return $actionsIdFilter;
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
        if ($table == '') {
            $table = $this->config['currentRecord']['table'];
        }
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&id=%s&table=%s&imagemode=1',
            urlencode('/module/web/list'), $pid, $table)
        );
    }

    public function makeScreenshotOfRecord(string $table='', int $uid=0, string $fileName='', string $selector = '', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $currentRecord = $this->goToRecord($table, $uid);
        $fileName = $this->getFileNameOfRecord($fileName, $currentRecord);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToRecord(string $table, int $uid):array
    {
        if ($table == '' || $uid < 1) {
            $table = $this->config['
            ']['table'];
            $uid = $this->config['currentRecord']['uid'];
        }
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit',
            urlencode('/record/edit'), $table, $uid
        ));
        return [
            'table' => $table,
            'uid' => $uid
        ];
    }

    protected function adjustFileNameToSchema(string $fileName, string $schema) : string
    {
        $ret = $fileName;
        switch($schema) {
            case 'UpperCamelCase':
                $ret = GeneralUtility::underscoredToUpperCamelCase($ret);
                break;
            case 'LowerCamelCase':
                $ret = GeneralUtility::underscoredToLowerCamelCase($ret);
                break;
            default:
                break;
        }
        return $ret;
    }

    protected function getFileNameOfRecord(string $fileName, array $currentRecord) : string
    {
        $ret = $fileName;
        if ($ret === ''){
            $ret = $this->config['fileNameDefaultField'];
            $ret = str_replace('###TABLE###', $currentRecord['table'], $ret);
            $ret = str_replace('###UID###', $currentRecord['uid'], $ret);
        }
        $ret = $this->adjustFileNameToSchema($ret, $this->config['fileNameSchema']);
        return $ret;
    }

    protected function getFileNameOfField(string $fileName, array $currentRecord, string $fields) : string
    {
        $ret = $fileName;
        if ($ret === ''){
            $ret = $this->config['fileNameDefaultField'];
            $ret = str_replace('###TABLE###', $currentRecord['table'], $ret);
            $ret = str_replace('###UID###', $currentRecord['uid'], $ret);
            $fields = explode('/', $fields);
            $ret = str_replace('###FIELDS###', implode('_', $fields), $ret);
            $ret = str_replace('###FIELD###', $fields[0], $ret);
            $ret = str_replace('###LAST_FIELD###', $fields[sizeof($fields) - 1], $ret);
        }
        switch($this->config['fileNameSchema']) {
            case 'UpperCamelCase':
                $ret = GeneralUtility::underscoredToUpperCamelCase($ret);
                break;
            case 'LowerCamelCase':
                $ret = GeneralUtility::underscoredToLowerCamelCase($ret);
                break;
            default:
                break;
        }
        return $ret;
    }

    public function makeScreenshotOfField(string $table = '', int $uid = 0, string $fields = '', string $fileName = '', string $selector = '.form-section', string $altText = '', string $refLabel = '', string $refTitle = ''): void
    {
        $this->getModule('WebDriver')->assertNotEmpty($fields);
        $currentRecord = $this->goToField($table, $uid, $fields);
        $fileName = $this->getFileNameOfField($fileName, $currentRecord, $fields);
        $this->makeScreenshotOfElement($fileName, $selector, $altText, $refLabel, $refTitle);
    }

    public function goToField(string $table, int $uid, string $fields): array
    {
        if ($table == '' || $uid < 1) {
            $table = $this->config['currentRecord']['table'];
            $uid = $this->config['currentRecord']['uid'];
        }
        $this->getWebDriver()->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit&columnsOnly=%s',
            urlencode('/record/edit'), $table, $uid, $fields
        ));
        return [
            'table' => $table,
            'uid' => $uid
        ];
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
}
