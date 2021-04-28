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

use TYPO3\CMS\Core\Utility\ArrayUtility;

class ArrayHelper
{
    /**
     * Extract field with path from array, e.g.
     *
     * Input:
     *  [
     *      'ctrl' => [],
     *      'columns' => [
     *          'title' => [
     *              'label' => 'title',
     *              'config' => []
     *          ]
     *      ]
     *  ]
     * Path: columns/title/label
     * Output:
     *  [
     *      'columns' => [
     *          'title' => [
     *              'label' => 'title'
     *          ]
     *      ]
     *  ]
     *
     * @param array $array
     * @param string $path
     * @return array
     */
    public static function getArrayByPath(array $array, string $path): array
    {
        $result = [];

        $value = ArrayUtility::getValueByPath($array, $path);
        $path = str_getcsv($path, '/');
        $pathReverse = array_reverse($path);

        for ($i=0; $i < count($pathReverse); $i++) {
            if ($i === 0) {
                $result = [$pathReverse[$i] => $value];
            } else {
                $result = [$pathReverse[$i] => $result];
            }
        }

        return $result;
    }
}
