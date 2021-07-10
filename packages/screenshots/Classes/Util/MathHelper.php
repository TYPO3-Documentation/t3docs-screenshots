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

class MathHelper
{
    /**
     * Determines position and dimension of an inner rectangle in relation to an outer rectangle.
     *
     * If the x-coordinate of the inner rectangle is negative, it is calculated from the right edge of the outer
     * rectangle. The same is true for the y-coordinate.
     * If the width of the inner rectangle is 0, it is expanded to the remaining width of the outer rectangle. The same
     * is true for the height.
     * If the width of the inner rectangle is negative, it is expanded to the remaining width of the outer rectangle
     * minus the specified width. The same applies to the height.
     *
     * @param int $x
     * @param int $y
     * @param int $width
     * @param int $height
     * @param int $outerWidth
     * @param int $outerHeight
     * @return array
     */
    public static function getRectangleInRectangle(
        int $x,
        int $y,
        int $width,
        int $height,
        int $outerWidth,
        int $outerHeight
    ): array {
        $x = $x < 0 ? $outerWidth - -$x : $x;
        $y = $y < 0 ? $outerHeight - -$y : $y;
        $width = $width > 0 ? min($width, $outerWidth - $x) : $outerWidth - $x - -$width;
        $height = $height > 0 ? min($height, $outerHeight - $y) : $outerHeight - $y - -$height;
        return ["x" => $x, "y" => $y, "width" => $width, "height" => $height];
    }
}
