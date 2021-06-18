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

use Symfony\Component\Yaml\Yaml;

class YamlHelper
{
    /**
     * Extract field with path from YAML, e.g.
     *
     * Input:
     * mappings:
     *   scalar: 'value'
     *   array: [ 'value1', 'value2' ]
     *   object: { key1: 'value1', key2: 'value2' }
     *
     * Path: mappings/object/key2
     *
     * Output:
     * mappings:
     *   object:
     *     key2: value2
     *
     * @param string $yaml
     * @param string $path
     * @param int $inlineLevel The level where you switch to inline YAML
     * @return string
     */
    public static function getYamlByPath(string $yaml, string $path, int $inlineLevel = 99): string
    {
        $arrayIn = Yaml::parse($yaml);
        $arrayOut = ArrayHelper::getArrayByPath($arrayIn, $path);
        $indentationSize = 2;
        return Yaml::dump($arrayOut, $inlineLevel, $indentationSize);
    }
}
