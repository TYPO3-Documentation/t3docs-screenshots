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

use TYPO3\Documentation\Screenshots\Util\JsonHelper;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class JsonHelperTest extends UnitTestCase
{
    /**
     * @test
     * @dataProvider extractFieldsFromJsonDataProvider
     *
     * @param string $json
     * @param array $fields
     * @param string $expected
     */
    public function extractFieldsFromJson(string $json, array $fields, string $expected): void
    {
        self::assertEquals($expected, trim(JsonHelper::extractFieldsFromJson($json, $fields)));
    }

    public function extractFieldsFromJsonDataProvider(): array
    {
        $json = file_get_contents(__DIR__ . '/../Fixtures/Json.json');

        return [
            [
                'json' => $json,
                'fields' => ['string'],
                'expected' => <<<'NOWDOC'
{
    "string": "value"
}
NOWDOC
            ],
            [
                'json' => $json,
                'fields' => ['array/1'],
                'expected' => <<<'NOWDOC'
{
    "array": {
        "1": 2
    }
}
NOWDOC
            ],
            [
                'json' => $json,
                'fields' => ['object/string'],
                'expected' => <<<'NOWDOC'
{
    "object": {
        "string": "value-3"
    }
}
NOWDOC
            ],
            [
                'json' => $json,
                'fields' => ['string', 'object'],
                'expected' => <<<'NOWDOC'
{
    "string": "value",
    "object": {
        "string": "value-3",
        "number": 3,
        "array": [
            "value-3-1",
            3.1000000000000001,
            {
                "string": "value-3-2-1: value-3-2-2, value-3-2-3",
                "number": 3.2000000000000002
            },
            "value-3-3"
        ]
    }
}
NOWDOC
            ]
        ];
    }

    /**
     * @test
     */
    public function extractFieldsFromJsonCombinesPrettyJsonAndInlineJson(): void
    {
        $json = file_get_contents(__DIR__ . '/../Fixtures/Json.json');
        $fields = ['object'];
        $expected = <<<'NOWDOC'
{
    "object": {
        "string": "value-3",
        "number": 3,
        "array": ["value-3-1", 3.1000000000000001, {"string": "value-3-2-1: value-3-2-2, value-3-2-3", "number": 3.2000000000000002}, "value-3-3"]
    }
}
NOWDOC;

        self::assertEquals($expected, JsonHelper::extractFieldsFromJson($json, $fields, 2));
    }

    /**
     * @test
     */
    public function extractFieldsFromJsonIncludesFullDataIfFieldsAreEmpty(): void
    {
        $json = file_get_contents(__DIR__ . '/../Fixtures/Json.json');
        $fields = [];

        self::assertEquals(json_decode($json), json_decode(JsonHelper::extractFieldsFromJson($json, $fields)));
    }

    /**
     * @test
     */
    public function extractFieldsFromJsonTriggersExceptionIfJsonIsEmpty(): void
    {
        $json = '';
        $fields = [];

        $this->expectException(\JsonException::class);

        JsonHelper::extractFieldsFromJson($json, $fields);
    }

    /**
     * @test
     */
    public function extractFieldsFromJsonTriggersExceptionIfJsonIsMalformed(): void
    {
        $json = <<<'NOWDOC'
{
    "key": "value",
}
NOWDOC;
        $fields = [];

        $this->expectException(\JsonException::class);

        JsonHelper::extractFieldsFromJson($json, $fields);
    }
}
