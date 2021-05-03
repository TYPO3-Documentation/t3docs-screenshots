<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Comparison;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Core\Utility\GeneralUtility;

class Image
{
    protected string $path;
    protected string $uri;
    protected int $changeTime;
    protected bool $existing;

    public function __construct(string $path, string $uri)
    {
        $this->path = $path;
        $this->uri = $uri;
        $this->refresh();
    }

    public function refresh(): void
    {
        if (is_file($this->path)) {
            $this->existing = true;
            $this->changeTime = filectime($this->path);
        } else {
            $this->existing = false;
            $this->changeTime = 0;
        }
    }

    public function write(string $content): void
    {
        GeneralUtility::mkdir_deep(dirname($this->path));
        GeneralUtility::writeFile($this->path, $content);
        $this->refresh();
    }

    public function getPath(): string
    {
        return $this->path;
    }

    public function getUri(): string
    {
        return $this->uri;
    }

    public function getUriWithCacheBust(): string
    {
        return $this->uri . ($this->changeTime === 0 ? '' : '?bust=' . $this->changeTime);
    }

    public function isExisting(): bool
    {
        return $this->existing;
    }

    public function getChangeTime(): int
    {
        return $this->changeTime;
    }
}
