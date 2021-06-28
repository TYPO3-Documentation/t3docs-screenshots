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

class JsonHelper
{
    /**
     * Extract fields from JSON, e.g.
     *
     * Input:
     * {
     *      "scalar": "value",
     *      "array": ["value1", "value2"],
     *      "object": {"key1": "value1", "key2": "value2"}
     * }
     *
     * Fields: ["array", "object/key2"]
     *
     * Output:
     * {
     *      "array": ["value1", "value2"],
     *      "object": {"key2": "value2"}
     * }
     *
     * @param string $json
     * @param array $fields
     * @param int $inlineLevel The level where you switch to inline JSON
     * @return string
     */
    public static function extractFieldsFromJson(string $json, array $fields, int $inlineLevel = 99): string
    {
        $arrayIn = self::parseArrayFromJson($json);
        $arrayOut = ArrayHelper::extractFieldsFromArray($arrayIn, $fields);
        return self::printJson($arrayOut, $inlineLevel);
    }

    public static function parseArrayFromJson(string $json): array
    {
        return json_decode($json, true, 512, JSON_THROW_ON_ERROR);
    }

    public static function printJson(array $jsonArray, int $inlineLevel = 99): string
    {
        $inlineJsons = [];

        self::grabInlineJsonsAndReplaceWithPlaceholders($jsonArray, $inlineLevel, $inlineJsons);

        $json = json_encode($jsonArray, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT | JSON_THROW_ON_ERROR);
        $json = str_replace(array_keys($inlineJsons), array_values($inlineJsons), $json);
        return $json;
    }

    protected static function grabInlineJsonsAndReplaceWithPlaceholders(
        &$jsonEntry,
        int $inlineLevel,
        array &$inlineJsons,
        array $keys = []
    ): void {
        if (!is_array($jsonEntry)) {
            return;
        }

        if ($inlineLevel > 0) {
            foreach ($jsonEntry as $key => &$child) {
                self::grabInlineJsonsAndReplaceWithPlaceholders(
                    $child,
                    $inlineLevel-1,
                    $inlineJsons,
                    array_merge($keys, [$key])
                );
            }
        } else {
            $placeholder = md5(implode('_', $keys));
            $inlineJson = json_encode($jsonEntry, JSON_UNESCAPED_SLASHES | JSON_THROW_ON_ERROR);
            $inlineJson = self::addWhitespaceToInlineJson($inlineJson);
            $inlineJsons["\"$placeholder\""] = $inlineJson;
            $jsonEntry = $placeholder;
        }
    }

    protected static function addWhitespaceToInlineJson(string $inlineJsons): string
    {
        return preg_replace(["#([0-9\"'}\]],)(\S)#", "#([\"']:)(\S)#"], "\\1 \\2", $inlineJsons);
    }

    public static function printPrettyJson(array $jsonArray): string
    {
        return self::printJson($jsonArray, 99);
    }

    public static function printInlineJson(array $jsonArray): string
    {
        return self::printJson($jsonArray, 0);
    }
}
