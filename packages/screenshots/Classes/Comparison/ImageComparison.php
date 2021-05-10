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

class ImageComparison
{
    protected File $imageActual;
    protected File $imageOriginal;
    protected File $imageDiff;
    protected float $threshold;
    protected float $difference;
    protected int $maxHeight;

    public function __construct(
        string $pathActual,
        string $pathOriginal,
        string $pathDiff,
        string $uriActual,
        string $uriOriginal,
        string $uriDiff,
        float $threshold
    ) {
        $this->imageActual = new File($pathActual, $uriActual);
        $this->imageOriginal = new File($pathOriginal, $uriOriginal);
        $this->imageDiff = new File($pathDiff, $uriDiff);
        $this->threshold = $threshold;
        $this->difference = 0;
        $this->maxHeight = 0;
    }

    public function process(): void
    {
        if ($this->imageOriginal->isExisting() === false) {
            $imagickActual = new \Imagick($this->imageActual->getPath());

            $this->difference = 1;
            $this->maxHeight = $imagickActual->getImageHeight();
        } else {
            $imagickActual = new \Imagick($this->imageActual->getPath());
            $imagickOriginal = new \Imagick($this->imageOriginal->getPath());

            $diff = $imagickActual->compareImages($imagickOriginal, \Imagick::METRIC_MEANABSOLUTEERROR);

            $this->difference = $diff[1];
            $this->maxHeight = max($imagickActual->getImageHeight(), $imagickOriginal->getImageHeight());

            if ($this->difference > $this->threshold) {
                $this->imageDiff->write((string)$diff[0]);
            }
        }
    }

    public function getImageActual(): File
    {
        return $this->imageActual;
    }

    public function getImageOriginal(): File
    {
        return $this->imageOriginal;
    }

    public function getImageDiff(): File
    {
        return $this->imageDiff;
    }

    public function getDifference(): float
    {
        return $this->difference;
    }

    public function getMaxHeight(): int
    {
        return $this->maxHeight;
    }
}
