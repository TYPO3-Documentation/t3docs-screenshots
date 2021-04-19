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

/**
 * Helper to provide code snippets of TYPO3.
 */
class Typo3CodeSnippets extends Module
{
    protected $config = [
        'sourcePath' => '',
        'targetPath' => 'CodeSnippets/Code',
        'rstPath' => 'CodeSnippets/Rst',
        'createRstFile' => true
    ];

    public function setCodeSnippetsSourcePath(string $path): void
    {
        $this->_setConfig(['sourcePath' => $path]);
    }

    public function setCodeSnippetsTargetPath(string $path): void
    {
        $this->_setConfig(['targetPath' => $path]);
    }

    public function setCodeSnippetsRstPath(string $path): void
    {
        $this->_setConfig(['rstPath' => $path]);
    }

    public function createCodeSnippetsRstFile(bool $create): void
    {
        $this->_setConfig(['createRstFile' => $create]);
    }

    /**
     * Copies TYPO3 PHP file to the documentation and generates a reST include file.
     *
     * @param string $sourceFile File path of PHP file relative to TYPO3 public folder,
     *                              e.g. "typo3/sysext/core/Configuration/TCA/be_groups.php"
     * @param string $targetFile File path of PHP file relative to code snippets target folder,
     *                              defaults to source file name if empty,
     *                              e.g. "core_be_groups.php"
     */
    public function createCodeSnippet(string $sourceFile, string $targetFile = ''): void
    {
        $targetFile = $targetFile !== '' ? $targetFile : pathinfo($sourceFile, PATHINFO_BASENAME);
        $targetFileName = pathinfo($targetFile, PATHINFO_FILENAME);
        $relativeTargetPath = $this->getRelativeTargetPath($targetFile);
        $absoluteTargetPath = $this->getAbsoluteDocumentationPath($relativeTargetPath);
        $absoluteSourcePath = $this->getAbsoluteTypo3Path($this->getRelativeSourcePath($sourceFile));

        $code = $this->read($absoluteSourcePath);
        $this->write($absoluteTargetPath, $code);

        if ($this->_getConfig('createRstFile')) {
            $this->createRstFile($targetFileName, $relativeTargetPath);
        }
    }

    protected function getRelativeTargetPath(string $filePath): string
    {
        $relativePath = [];
        if ($this->_getConfig('targetPath') !== '') {
            $relativePath[] = $this->_getConfig('targetPath');
        }
        $relativePath[] = $filePath;
        return implode(DIRECTORY_SEPARATOR, $relativePath);
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

    protected function write(string $path, string $code): void
    {
        @mkdir(dirname($path), 0777, true);
        file_put_contents($path, $code);
    }

    protected function createRstFile(string $fileName, string $relativeCodeSnippetPath): void
    {
        $relativeRstPath = $this->getRelativeRstPath($fileName);
        $absoluteRstPath = $this->getAbsoluteDocumentationPath($relativeRstPath);

        //TODO: Add ":start-at: start $field" and ":end-at: end $field"
        $rst = <<<HEREDOC
.. Automatic screenshot: Remove this line if you want to manually change this file

.. literalinclude:: /$relativeCodeSnippetPath
   :language: php
   :lines: 2-
HEREDOC;

        @mkdir(dirname($absoluteRstPath), 0777, true);
        file_put_contents($absoluteRstPath, $rst);
    }

    protected function getRelativeRstPath(string $fileName): string
    {
        return $this->_getConfig('rstPath') . DIRECTORY_SEPARATOR . $fileName . '.rst.txt';
    }
}
