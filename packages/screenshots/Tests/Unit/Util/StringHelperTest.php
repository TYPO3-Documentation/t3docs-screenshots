<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Tests\Unit\Util;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\Documentation\Screenshots\Util\StringHelper;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class StringHelperTest extends UnitTestCase
{
    /**
     * @test
     */
    public function indentMultilineText(): void
    {
        $text = <<<'NOWDOC'
:alt: This is a TCA table
:class: with-shadow

:ref:`A caption text linked to my-reference <my-reference>`
NOWDOC;
        $indentation = '   ';
        $expected = <<<'NOWDOC'
   :alt: This is a TCA table
   :class: with-shadow
   
   :ref:`A caption text linked to my-reference <my-reference>`
NOWDOC;

        self::assertEquals($expected, StringHelper::indentMultilineText($text, $indentation));
    }
}
