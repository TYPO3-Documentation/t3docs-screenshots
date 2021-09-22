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

class StringHelper
{
    /**
     * @param string $text
     * @param string $indentation
     * @return string Indented text
     */
    public static function indentMultilineText(string $text, string $indentation): string
    {
        return $indentation . implode("\n$indentation", explode("\n", $text));
    }
}
