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

namespace TYPO3\CMS\Screenshots\Acceptance;

/**
 * Handle screenshots related configuration files "screenshots.json"
 */
class Configuration
{
    protected $filePath;
    protected $config;

    public function __construct(string $filePath)
    {
        $this->filePath = $filePath;
    }

    public function read(): void
    {
        $this->config = json_decode(file_get_contents($this->filePath), true) ?? [];
    }

    public function getConfig(): array
    {
        return $this->config;
    }
}
