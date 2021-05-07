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
    public static function getFoldersRecursively(string $path, array &$folders = []): array
    {
        $subFolders = scandir($path);

        foreach ($subFolders as $subFolder) {
            $subPath = realpath($path . DIRECTORY_SEPARATOR . $subFolder);
            if (is_dir($subPath) && $subFolder != "." && $subFolder != "..") {
                $folders[] = $subPath;
                self::getFoldersRecursively($subPath, $folders);
            }
        }

        return $folders;
    }
}
