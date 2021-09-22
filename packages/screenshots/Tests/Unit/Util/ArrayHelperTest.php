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

use TYPO3\Documentation\Screenshots\Util\ArrayHelper;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class ArrayHelperTest extends UnitTestCase
{
    /**
     * @test
     * @dataProvider extractFieldsFromArrayDataProvider
     *
     * @param array $array
     * @param array $fields
     * @param array $expected
     */
    public function extractFieldsFromArray(array $array, array $fields, array $expected): void
    {
        self::assertEquals($expected, ArrayHelper::extractFieldsFromArray($array, $fields));
    }

    public function extractFieldsFromArrayDataProvider(): array
    {
        $tca = [
            'ctrl' => [],
            'columns' => [
                'title' => [
                    'exclude' => 1,
                    'label' => 'title',
                    'config' => [],
                ],
            ]
        ];

        return [
            [
                'array' => $tca,
                'fields' => ['ctrl'],
                'expected' => [
                    'ctrl' => []
                ]
            ],
            [
                'array' => $tca,
                'fields' => ['columns/title/exclude', 'columns/title/label'],
                'expected' => [
                    'columns' => [
                        'title' => [
                            'exclude' => 1,
                            'label' => 'title',
                        ]
                    ]
                ]
            ]
        ];
    }

    /**
     * @test
     */
    public function extractFieldsFromArrayIncludesFullDataIfFieldsAreEmpty(): void
    {
        $array = [
            'ctrl' => [],
            'columns' => [
                'title' => [
                    'label' => 'title',
                    'config' => [],
                ],
            ]
        ];
        $fields = [];

        self::assertEquals($array, ArrayHelper::extractFieldsFromArray($array, $fields));
    }
}
