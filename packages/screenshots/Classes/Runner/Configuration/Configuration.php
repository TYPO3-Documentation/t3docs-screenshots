<?php

declare(strict_types=1);

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

namespace TYPO3\CMS\Screenshots\Runner\Configuration;

use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Core\Utility\PathUtility;

/**
 * Handle screenshots related configuration file "screenshots.json"
 */
class Configuration
{
    protected string $basePath = '/var/www/html/public/t3docs';
    protected string $fileName = 'screenshots.json';

    protected string $path;
    protected array $config;

    public function __construct(string $path = '')
    {
        $this->path = $this->getAbsolutePath($path);
        $this->config = [];
    }

    protected function getAbsolutePath(string $path): string
    {
        $path = strpos($path, '/') === 0 ? $path : $this->basePath . '/' . $path;
        return PathUtility::getCanonicalPath($path);
    }

    public function read(): void
    {
        $this->config = json_decode(file_get_contents($this->getFilePath()), true) ?? [];
    }

    public function write(): void
    {
        GeneralUtility::mkdir_deep($this->path);
        file_put_contents($this->getFilePath(), json_encode($this->config, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));
    }

    public function getFilePath(): string
    {
        return $this->path . '/' . $this->fileName;
    }

    public function getBasePath(): string
    {
        return $this->basePath;
    }

    public function getPath(): string
    {
        return $this->path;
    }

    public function getConfig(): array
    {
        return $this->config;
    }

    public function setConfig(array $config): void
    {
        $this->config = $config;
    }

    public function createBasicConfig(): void
    {
        $this->config = [
            'suites' => [
                'Introduction' => [
                    'screenshots' => [
                        [
                            ['action' => 'see', 'text' => "Page"],
                            ['action' => 'click', 'link' => "Page"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'makeScreenshotOfWindow', 'path' => "Images/introduction_dashboard"]
                        ]
                    ]
                ],
                'Styleguide' => [
                    'screenshots' => [
                        [
                            ['action' => 'see', 'text' => "Page"],
                            ['action' => 'click', 'link' => "Page"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'makeScreenshotOfWindow', 'path' => 'Images/stylesheet_dashboard']
                        ]
                    ]
                ]
            ]
        ];
    }
}
