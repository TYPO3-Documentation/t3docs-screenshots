<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Runner\Codeception\Support\Helper;

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
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\Documentation\Screenshots\Util\FileHelper;

/**
 * Helper to access TYPO3 file system.
 */
class Typo3FileSystem extends Module
{
    public function writeFileToTypo3PublicPath(string $filePath, string $content = ''): void
    {
        $filePath = FileHelper::getPathBySegments(Environment::getPublicPath(), $filePath);
        GeneralUtility::mkdir_deep(dirname($filePath));
        GeneralUtility::writeFile($filePath, $content);
    }

    public function deleteFileInTypo3PublicPath(string $filePath): void
    {
        $filePath = FileHelper::getPathBySegments(Environment::getPublicPath(), $filePath);
        unlink($filePath);
    }
}
