<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Unit\Util;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Symfony\Component\Yaml\Yaml;
use TYPO3\CMS\Screenshots\Util\YamlHelper;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class YamlHelperTest extends UnitTestCase
{
    /**
     * @test
     * @dataProvider getYamlByPathDataProvider
     *
     * @param string $yaml
     * @param string $path
     * @param string $expected
     */
    public function getYamlByPath(string $yaml, string $path, string $expected): void
    {
        self::assertEquals($expected, trim(YamlHelper::getYamlByPath($yaml, $path)));
    }

    public function getYamlByPathDataProvider(): array
    {
        $yaml = file_get_contents(__DIR__ . '/../Fixtures/Yaml.yaml');

        return [
            [
                'yaml' => $yaml,
                'path' => 'scalar',
                'expected' => <<<'NOWDOC'
scalar: value
NOWDOC
            ],
            [
                'yaml' => $yaml,
                'path' => 'sequences/1',
                'expected' => <<<'NOWDOC'
sequences:
  1:
    item1key1: value
NOWDOC
            ],
            [
                'yaml' => $yaml,
                'path' => 'mappings/MyVendor\MyExtension\MyClass',
                'expected' => <<<'NOWDOC'
mappings:
  MyVendor\MyExtension\MyClass:
    scalar: value
NOWDOC
            ],
            [
                'yaml' => $yaml,
                'path' => 'mappings/MyVendor\MyExtension\MyOtherClass/object/key1',
                'expected' => <<<'NOWDOC'
mappings:
  MyVendor\MyExtension\MyOtherClass:
    object:
      key1: value1
NOWDOC
            ]
        ];
    }

    /**
     * @test
     */
    public function getYamlByPathIncludesFullDataIfPathIsEmpty(): void
    {
        $yaml = file_get_contents(__DIR__ . '/../Fixtures/Yaml.yaml');
        $path = '';

        self::assertEquals(Yaml::parse($yaml), Yaml::parse(YamlHelper::getYamlByPath($yaml, $path)));
    }

    /**
     * @test
     */
    public function getYamlByPathTriggersExceptionIfYamlIsEmpty(): void
    {
        $yaml = '';
        $path = '';

        $this->expectException(\TypeError::class);

        YamlHelper::getYamlByPath($yaml, $path);
    }
}
