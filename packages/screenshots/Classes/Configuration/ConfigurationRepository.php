<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Configuration;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Core\SingletonInterface;
use TYPO3\CMS\Screenshots\Util\FileHelper;

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
        $configurations = [];

        $paths = FileHelper::getSubFolders($this->basePath);
        foreach ($paths as $path) {
            $configuration = new Configuration($path);
            if ($configuration->isExisting()) {
                $configurations[] = $configuration;
            }
        }

        return $configurations;
    }

    /**
     * @param string $path
     * @return Configuration[]
     */
    public function findByPath(string $path): array
    {
        $configurations = [];

        $configuration = new Configuration($path);
        if ($configuration->isExisting()) {
            $configurations[] = $configuration;
        }

        return $configurations;
    }
}
