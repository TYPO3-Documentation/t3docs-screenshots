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
        $this->_setConfig(['sourcePath' => $path]);
    }

    public function setCodeSnippetsTargetPath(string $path): void
    {
        $this->_setConfig(['targetPath' => $path]);
    }

    /**
     * Reads a TYPO3 PHP file and generates a reST file from it for inclusion.
     *
     * @param string $sourceFile File path of PHP file relative to TYPO3 public folder,
     *                              e.g. "typo3/sysext/core/Configuration/TCA/be_groups.php"
     * @param string $targetFileName File path without file extension of reST file relative to code snippets target folder,
     *                              defaults to source file name if empty,
     *                              e.g. "core_be_groups"
     */
    public function createCodeSnippet(string $sourceFile, string $targetFileName = ''): void
    {
        $targetFileName = $targetFileName !== '' ? $targetFileName : pathinfo($sourceFile, PATHINFO_FILENAME);
        $relativeTargetPath = $this->getRelativeTargetPath($targetFileName);
        $absoluteTargetPath = $this->getAbsoluteDocumentationPath($relativeTargetPath);
        $absoluteSourcePath = $this->getAbsoluteTypo3Path($this->getRelativeSourcePath($sourceFile));

        $code = $this->read($absoluteSourcePath);
        $this->write($absoluteTargetPath, $code);
    }

    /**
     * Reads a TYPO3 PHP array file and generates a reST file from it for inclusion.
     *
     * @param string $sourceFile File path of PHP array file relative to TYPO3 public folder,
     *                              e.g. "typo3/sysext/core/Configuration/TCA/be_groups.php"
     * @param string $field Reduce the PHP array to this field. Use a comma-separated list to specify a field of a
     *                              multidimensional array,
     *                              e.g. "columns,title"
     * @param string $targetFileName File path without file extension of reST file relative to code snippets target folder,
     *                              defaults to source file name if empty,
     *                              e.g. "core_be_groups"
     */
    public function createPhpArrayCodeSnippet(string $sourceFile, string $field = '', string $targetFileName = ''): void
    {
        $targetFileName = $targetFileName !== '' ? $targetFileName : pathinfo($sourceFile, PATHINFO_FILENAME);
        $relativeTargetPath = $this->getRelativeTargetPath($targetFileName);
        $absoluteTargetPath = $this->getAbsoluteDocumentationPath($relativeTargetPath);
        $absoluteSourcePath = $this->getAbsoluteTypo3Path($this->getRelativeSourcePath($sourceFile));

        $code = $this->readPhpArray($absoluteSourcePath, $field);
        $this->write($absoluteTargetPath, $code);
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
        $absolutePath[] = Environment::getPublicPath();
        $absolutePath[] = $relativePath;
        return implode(DIRECTORY_SEPARATOR, $absolutePath);
    }

    protected function getAbsoluteDocumentationPath(string $relativePath): string
    {
        $absolutePath = [];
        $absolutePath[] = $this->getModule(Typo3Screenshots::class)->_getConfig('basePath');
        if ($this->getModule(Typo3Screenshots::class)->_getConfig('documentationPath') !== '') {
            $absolutePath[] = $this->getModule(Typo3Screenshots::class)->_getConfig('documentationPath');
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
        $tca = include $path;

        if ($field === '') {
            $code = ArrayUtility::arrayExport($tca);
        } else {
            $code = sprintf("'%s' => %s\n",
                $field, ArrayUtility::arrayExport(ArrayUtility::getValueByPath($tca, $field))
            );
        }
        return $code;
    }

    protected function write(string $path, string $code): void
    {
        $code = $this->indentCode($code, '   ');

        $rst = <<<HEREDOC
.. Automatic screenshot: Remove this line if you want to manually change this file

.. code:: php

$code
HEREDOC;

        @mkdir(dirname($path), 0777, true);
        file_put_contents($path, $rst);
    }

    protected function indentCode(string $code, string $indentation): string
    {
        return $indentation . implode("\n$indentation", explode("\n", $code));
    }
}
