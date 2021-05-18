<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Util;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

class FileHelper
{
    public static function getFoldersRecursively(string $path, int $maxDepth = 999, array &$folders = []): array
    {
        if ($maxDepth > 0) {
            $maxDepth--;

            $subFolders = scandir($path);
            foreach ($subFolders as $subFolder) {
                $subPath = self::getRealPath($path . DIRECTORY_SEPARATOR . $subFolder);
                if (is_dir($subPath) && $subFolder != "." && $subFolder != "..") {
                    $folders[] = $subPath;
                    self::getFoldersRecursively($subPath, $maxDepth, $folders);
                }
            }
        }

        return $folders;
    }

    public static function getSubFolders(string $path): array
    {
        return self::getFoldersRecursively($path, 1);
    }

    public static function deleteRecursively(string $path): void
    {
        if (is_dir($path)) {
            $subFolders = scandir($path);
            foreach ($subFolders as $subFolder) {
                $subPath = self::getRealPath($path . DIRECTORY_SEPARATOR . $subFolder);
                if (is_file($subPath)) {
                    unlink($subPath);
                }
                elseif (is_dir($subPath) && $subFolder != "." && $subFolder != "..") {
                    self::deleteRecursively($subPath);
                }
            }
            rmdir($path);
        }
    }

    /**
     * The PHP function realpath() is not supported by the PHP stream wrapper vfsStream.
     *
     * @param string $path
     * @return string
     *
     * @see https://github.com/bovigo/vfsStream/wiki/Known-Issues
     */
    public static function getRealPath(string $path): string
    {
        return strpos($path, 'vfs://') === 0 ? $path : realpath($path);
    }
}
