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
 * Handle all available configuration files "screenshots.json"
 */
class ConfigurationRepository implements SingletonInterface
{
    protected string $basePath;

    public function __construct(string $basePath)
    {
        $this->basePath = $basePath;
    }

    /**
     * @return Configuration[]
     */
    public function findAll(): array
    {
        return $this->findByPath($this->basePath);
    }

    /**
     * @param string $folderPath
     * @return Configuration[]
     */
    public function findByPath(string $folderPath): array
    {
        $configurations = [];

        $filePaths = FileHelper::getFilesByNameRecursively(Configuration::$fileName, $this->getAbsolutePath($folderPath));
        foreach ($filePaths as $filePath) {
            $folderPath = dirname($filePath);
            $configuration = new Configuration($folderPath);
            $configurations[] = $configuration;
        }

        return $configurations;
    }

    protected function getAbsolutePath(string $path): string
    {
        $path = FileHelper::getPathBySegments($path);
        if (!FileHelper::isAbsolutePath($path)) {
            $path = FileHelper::getPathBySegments($this->basePath, $path);
        }

        return $path;
    }
}
