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

    /**
     * Compose path from segments by
     *
     * - dismissing all empty segments
     * - replacing all separators by the system specific directory separator
     * - removing superfluous beginning and trailing separators
     *
     * @param string ...$segments
     * @return string
     */
    public static function getPathBySegments(string ...$segments): string
    {
        $path = [];
        foreach ($segments as $position => $segment) {
            if ($segment !== '') {
                $segment = str_replace(['/', '\\'], DIRECTORY_SEPARATOR, $segment);
                $isFirstAndAbsolute = $position === 0 && strpos($segment, DIRECTORY_SEPARATOR) === 0;
                if ($isFirstAndAbsolute) {
                    $segment = substr($segment, -1) === DIRECTORY_SEPARATOR ? substr($segment, 0, -1) : $segment;
                    $path[] = $segment;
                } else {
                    $segment = trim($segment, DIRECTORY_SEPARATOR);
                    if ($segment !== '') {
                        $path[] = $segment;
                    }
                }
            }
        }
        return implode(DIRECTORY_SEPARATOR, $path);
    }

    /**
     * Compose url from segments by
     *
     * - dismissing all empty segments
     * - replacing all separators by the general url separator
     * - removing superfluous beginning and trailing separators
     *
     * @param string ...$segments
     * @return string
     */
    public static function getUrlBySegments(string ...$segments): string
    {
        $path = [];
        foreach ($segments as $position => $segment) {
            if ($segment !== '') {
                $segment = str_replace(['/', '\\'], '/', $segment);
                $isFirstAndAbsolute = $position === 0 && (strpos($segment, '://') !== false || strpos($segment, '/') === 0);
                if ($isFirstAndAbsolute) {
                    $segment = substr($segment, -1) === '/' ? substr($segment, 0, -1) : $segment;
                    $path[] = $segment;
                } else {
                    $segment = trim($segment, '/');
                    if ($segment !== '') {
                        $path[] = $segment;
                    }
                }
            }
        }
        return implode('/', $path);
    }
}
