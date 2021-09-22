<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Util;

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
     * Extract fields from array, e.g.
     *
     * Input:
     *  [
     *      'ctrl' => [],
     *      'columns' => [
     *          'title' => [
     *              'exclude' => 1,
     *              'label' => 'title',
     *              'config' => []
     *          ]
     *      ]
     *  ]
     * Fields: ["columns/title/label", "columns/title/config"]
     * Output:
     *  [
     *      'columns' => [
     *          'title' => [
     *              'label' => 'title',
     *              'config' => []
     *          ]
     *      ]
     *  ]
     *
     * @param array $array
     * @param array $fields
     * @return array
     */
    public static function extractFieldsFromArray(array $array, array $fields): array
    {
        if (empty($fields)) {
            return $array;
        }

        $result = [];
        foreach ($fields as $field) {
            $result = array_merge_recursive($result, self::extractFieldFromArray($array, $field));
        }

        return $result;
    }

    protected static function extractFieldFromArray(array $array, string $field): array
    {
        if ($field === '') {
            return $array;
        }

        $result = [];

        $value = ArrayUtility::getValueByPath($array, $field);
        $path = str_getcsv($field, '/');
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
