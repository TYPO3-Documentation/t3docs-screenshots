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
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\CMS\Core\Utility\ArrayUtility;
use TYPO3\CMS\Screenshots\Util\ArrayHelper;
use TYPO3\CMS\Screenshots\Util\XmlHelper;

/**
 * Helper to provide code snippets of TYPO3.
 */
class Typo3CodeSnippets extends Module
{
    protected $config = [
        'sourcePath' => '',
        'targetPath' => 'CodeSnippets'
    ];

    public function setCodeSnippetsSourcePath(string $path): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['sourcePath' => $path]));
    }

    public function setCodeSnippetsTargetPath(string $path): void
    {
        $this->_reconfigure(array_merge($this->_getConfig(), ['targetPath' => $path]));
    }

    public function resetCodeSnippetsConfig(): void
    {
        $this->_resetConfig();
    }

    /**
     * Reads a TYPO3 PHP file and generates a reST file from it for inclusion.
     *
     * @param string $sourceFile File path of PHP file relative to TYPO3 public folder,
     *                              e.g. "typo3/sysext/core/Configuration/TCA/be_groups.php"
     * @param string $targetFileName File path without file extension of reST file relative to code snippets target folder,
     *                              e.g. "core_be_groups"
     * @param string $language The programming language of the code snippet,
     *                          e.g. "php"
     */
    public function createCodeSnippet(string $sourceFile, string $targetFileName, string $language = ''): void
    {
        $language = $language !== '' ? $language : $this->getCodeLanguageByFileExtension($sourceFile);
        $relativeTargetPath = $this->getRelativeTargetPath($targetFileName);
        $absoluteTargetPath = $this->getAbsoluteDocumentationPath($relativeTargetPath);
        $absoluteSourcePath = $this->getAbsoluteTypo3Path($this->getRelativeSourcePath($sourceFile));

        $code = $this->read($absoluteSourcePath);
        $this->write($absoluteTargetPath, $code, $language);
    }

    /**
     * Reads a TYPO3 PHP array file and generates a reST file from it for inclusion.
     *
     * @param string $sourceFile File path of PHP array file relative to TYPO3 public folder,
     *                              e.g. "typo3/sysext/core/Configuration/TCA/be_groups.php"
     * @param string $targetFileName File path without file extension of reST file relative to code snippets target folder,
     *                              e.g. "CoreBeGroups"
     * @param string $field Reduce the PHP array to this field. Use a slash-separated list to specify a field of a
     *                              multidimensional array,
     *                              e.g. "columns/title"
     */
    public function createPhpArrayCodeSnippet(string $sourceFile, string $targetFileName, string $field = ''): void
    {
        $relativeTargetPath = $this->getRelativeTargetPath($targetFileName);
        $absoluteTargetPath = $this->getAbsoluteDocumentationPath($relativeTargetPath);
        $absoluteSourcePath = $this->getAbsoluteTypo3Path($this->getRelativeSourcePath($sourceFile));

        $code = $this->readPhpArray($absoluteSourcePath, $field);
        $this->write($absoluteTargetPath, $code, 'php');
    }

    /**
     * Reads a TYPO3 XML file and generates a reST file from it for inclusion.
     *
     * @param string $sourceFile File path of XML file relative to TYPO3 public folder,
     *                              e.g. "typo3/sysext/form/Configuration/FlexForms/FormFramework.xml"
     * @param string $targetFileName File path without file extension of reST file relative to code snippets target folder,
     *                              e.g. "FormFrameworkXmlSheetTitle"
     * @param string $field Reduce the XML structure to this field. Use a slash-separated list to specify a field in
     *                              depth,
     *                              e.g. "T3DataStructure/sheets/sDEF/ROOT/TCEforms/sheetTitle"
     */
    public function createXmlCodeSnippet(string $sourceFile, string $targetFileName, string $field = ''): void
    {
        $relativeTargetPath = $this->getRelativeTargetPath($targetFileName);
        $absoluteTargetPath = $this->getAbsoluteDocumentationPath($relativeTargetPath);
        $absoluteSourcePath = $this->getAbsoluteTypo3Path($this->getRelativeSourcePath($sourceFile));

        $code = $this->readXml($absoluteSourcePath, $field);
        $this->write($absoluteTargetPath, $code, 'xml');
    }

    protected function getCodeLanguageByFileExtension(string $filePath): string
    {
        $fileExtension = pathinfo($filePath, PATHINFO_EXTENSION);

        switch ($fileExtension) {
            case 'xml':
            case 'xlf':
                $language = 'xml';
                break;
            case 'ts':
            case 'typoscript':
                $language = 'typoscript';
                break;
            case 'sql':
                $language = 'sql';
                break;
            case 'html':
                $language = 'html';
                break;
            case 'yaml':
                $language = 'yaml';
                break;
            case 'php':
                $language = 'php';
                break;
            default:
                throw new \Exception(
                    sprintf(
                        'The programming language of the file "%s" cannot be determined automatically via the ' .
                        'file extension "%s". Please specify the language explicitly.',
                        $filePath, $fileExtension
                    ),
                    4001
                );
        }

        return $language;
    }

    protected function getRelativeTargetPath(string $filePath): string
    {
        $relativePath = [];
        if ($this->_getConfig('targetPath') !== '') {
            $relativePath[] = $this->_getConfig('targetPath');
        }
        $relativePath[] = $filePath;
        return implode(DIRECTORY_SEPARATOR, $relativePath) . '.rst.txt';
    }

    protected function getRelativeSourcePath(string $filePath): string
    {
        $relativePath = [];
        if ($this->_getConfig('sourcePath') !== '') {
            $relativePath[] = $this->_getConfig('sourcePath');
        }
        $relativePath[] = $filePath;
        return implode(DIRECTORY_SEPARATOR, $relativePath);
    }

    protected function getAbsoluteTypo3Path(string $relativePath): string
    {
        $absolutePath = [];
        if (Environment::getPublicPath() !== '') {
            $absolutePath[] = Environment::getPublicPath();
        }
        $absolutePath[] = $relativePath;
        return implode(DIRECTORY_SEPARATOR, $absolutePath);
    }

    protected function getAbsoluteDocumentationPath(string $relativePath): string
    {
        $absolutePath = [];
        if ($this->getTypo3Screenshots()->_getConfig('basePath') !== '') {
            $absolutePath[] = $this->getTypo3Screenshots()->_getConfig('basePath');
        }
        if ($this->getTypo3Screenshots()->_getConfig('documentationPath') !== '') {
            $absolutePath[] = $this->getTypo3Screenshots()->_getConfig('documentationPath');
        }
        $absolutePath[] = $relativePath;
        return implode(DIRECTORY_SEPARATOR, $absolutePath);
    }

    protected function read(string $path): string
    {
        $code = file_get_contents($path);
        return $code;
    }

    protected function readPhpArray(string $path, string $field = ''): string
    {
        $phpArray = include $path;

        if ($field === '') {
            $code = ArrayUtility::arrayExport($phpArray);
        } else {
            $phpArray = ArrayHelper::getArrayByPath($phpArray, $field);
            $code = sprintf("'%s' => %s\n",
                key($phpArray), ArrayUtility::arrayExport(current($phpArray))
            );
        }
        return $code;
    }

    protected function readXml(string $path, string $field = ''): string
    {
        $xml = file_get_contents($path);
        $code = XmlHelper::getXmlByPath($xml, $field);
        return $code;
    }

    protected function write(string $path, string $code, string $language): void
    {
        $code = $this->indentCode($code, '   ');

        $rst = <<<'NOWDOC'
.. Automatic screenshot: Remove this line if you want to manually change this file

.. code-block:: %s

%s
NOWDOC;

        $rst = sprintf($rst, $language, $code);

        @mkdir(dirname($path), 0777, true);
        file_put_contents($path, $rst);
    }

    protected function indentCode(string $code, string $indentation): string
    {
        return $indentation . implode("\n$indentation", explode("\n", $code));
    }

    public function getTypo3Screenshots(): Typo3Screenshots
    {
        return $this->getModule(Typo3Screenshots::class);
    }
}
