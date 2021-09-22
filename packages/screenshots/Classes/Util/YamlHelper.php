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

use Symfony\Component\Yaml\Yaml;

class YamlHelper
{
    /**
     * Extract fields from YAML, e.g.
     *
     * Input:
     * mappings:
     *   scalar: 'value'
     *   array: [ 'value1', 'value2' ]
     *   object: { key1: 'value1', key2: 'value2' }
     *
     * Fields: ["mappings/array", "mappings/object/key2"]
     *
     * Output:
     * mappings:
     *   array:
     *     - value1
     *     - value2
     *   object:
     *     key2: value2
     *
     * @param string $yaml
     * @param array $fields
     * @param int $inlineLevel The level where you switch to inline YAML
     * @return string
     */
    public static function extractFieldsFromYaml(string $yaml, array $fields, int $inlineLevel = 99): string
    {
        $arrayIn = Yaml::parse($yaml);
        $arrayOut = ArrayHelper::extractFieldsFromArray($arrayIn, $fields);
        $indentationSize = 2;
        return Yaml::dump($arrayOut, $inlineLevel, $indentationSize);
    }
}
