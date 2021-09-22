<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Configuration;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Core\SingletonInterface;
use TYPO3\Documentation\Screenshots\Util\FileHelper;

/**
 * Provides extension-wide configuration
 */
class ExtensionConfiguration implements SingletonInterface
{
    protected string $originalPath;
    protected string $actualPath;
    protected string $diffPath;

    public function __construct()
    {
        $this->originalPath = 't3docs';
        $this->actualPath = 't3docs-generated/actual';
        $this->diffPath = 't3docs-generated/diff';
    }

    public function getOriginalPath(string $relativePath = ''): string
    {
        return FileHelper::getPathBySegments($this->originalPath, $relativePath);
    }

    /**
     * Note:
     * Do not use GeneralUtility::getFileAbsFileName() here to get the absolute path as the public path segment gets
     * changed from "/var/www/html/public" to "/var/www/html/public/typo3temp/var/tests/acceptance" on screenshots run.
     *
     * @return string
     */
    public function getAbsoluteOriginalPath(string $relativePath = ''): string
    {
        return FileHelper::getPathBySegments('/var/www/html/public', $this->getOriginalPath($relativePath));
    }

    public function getAbsoluteOriginalUrl(string $relativePath = ''): string
    {
        return FileHelper::getUrlBySegments('/', $this->getOriginalPath($relativePath));
    }

    public function getActualPath(string $relativePath = ''): string
    {
        return FileHelper::getPathBySegments($this->actualPath, $relativePath);
    }

    /**
     * Note:
     * Do not use GeneralUtility::getFileAbsFileName() here to get the absolute path as the public path segment gets
     * changed from "/var/www/html/public" to "/var/www/html/public/typo3temp/var/tests/acceptance" on screenshots run.
     *
     * @return string
     */
    public function getAbsoluteActualPath(string $relativePath = ''): string
    {
        return FileHelper::getPathBySegments('/var/www/html/public', $this->getActualPath($relativePath));
    }

    public function getAbsoluteActualUrl(string $relativePath = ''): string
    {
        return FileHelper::getUrlBySegments('/', $this->getActualPath($relativePath));
    }

    public function getDiffPath(string $relativePath = ''): string
    {
        return FileHelper::getPathBySegments($this->diffPath, $relativePath);
    }

    /**
     * Note:
     * Do not use GeneralUtility::getFileAbsFileName() here to get the absolute path as the public path segment gets
     * changed from "/var/www/html/public" to "/var/www/html/public/typo3temp/var/tests/acceptance" on screenshots run.
     *
     * @return string
     */
    public function getAbsoluteDiffPath(string $relativePath = ''): string
    {
        return FileHelper::getPathBySegments('/var/www/html/public', $this->getDiffPath($relativePath));
    }

    public function getAbsoluteDiffUrl(string $relativePath = ''): string
    {
        return FileHelper::getUrlBySegments('/', $this->getDiffPath($relativePath));
    }
}
