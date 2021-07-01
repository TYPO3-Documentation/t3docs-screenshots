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

use SebastianBergmann\Diff\Differ;

class TextFileComparison
{
    protected File $fileActual;
    protected File $fileOriginal;
    protected File $fileDiff;
    protected float $difference;

    public function __construct(
        string $pathActual,
        string $pathOriginal,
        string $pathDiff,
        string $uriActual,
        string $uriOriginal,
        string $uriDiff
    ) {
        $this->fileActual = new File($pathActual, $uriActual);
        $this->fileOriginal = new File($pathOriginal, $uriOriginal);
        $this->fileDiff = new File($pathDiff, $uriDiff);
        $this->difference = 0;
    }

    public function process(): void
    {
        $fileContentOriginal = $this->fileOriginal->getContent();
        $fileContentActual = $this->fileActual->getContent();

        if ($fileContentOriginal === '') {
            $this->difference = 1;
        } elseif ($fileContentOriginal !== $fileContentActual) {
            $this->difference = 0.5;
        } else {
            $this->difference = 0;
        }

        if ($this->difference > 0) {
            $differ = new Differ();
            $diff = $differ->diff($fileContentOriginal, $fileContentActual);
            $this->fileDiff->write($diff);
        }
    }

    public function getFileActual(): File
    {
        return $this->fileActual;
    }

    public function getFileOriginal(): File
    {
        return $this->fileOriginal;
    }

    public function getFileDiff(): File
    {
        return $this->fileDiff;
    }

    public function getDifference(): float
    {
        return $this->difference;
    }
}
