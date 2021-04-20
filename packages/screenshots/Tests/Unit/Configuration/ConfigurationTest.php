<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Unit\Configuration;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use org\bovigo\vfs\vfsStream;
use TYPO3\CMS\Screenshots\Configuration\Configuration;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class ConfigurationTest extends UnitTestCase
{
    /**
     * @test
     * @dataProvider configMatchesAfterWritingAndReadingDataProvider
     *
     * @param array $config
     */
    public function configMatchesAfterWritingAndReading(array $config): void
    {
        $GLOBALS['TYPO3_CONF_VARS']['SYS']['folderCreateMask'] = '0770';
        $root = vfsStream::setup('t3docs');

        $configurationWrite = new Configuration($root->url());
        $configurationWrite->setConfig($config);
        $configurationWrite->write();

        $configurationRead = new Configuration($root->url());
        $configurationRead->read();

        self::assertEquals($config, $configurationRead->getConfig());
    }

    public function configMatchesAfterWritingAndReadingDataProvider(): array
    {
        $configuration = new Configuration();
        $configuration->createBasicConfig();

        return [
            'simple' => [
                'suites' => [
                    'Introduction' => [
                        'screenshots' => [
                            [
                                ['action' => 'makeScreenshotOfWindow', 'fileName' => "introduction_dashboard"]
                            ]
                        ]
                    ]
                ]
            ],
            'nested' => [
                'suites' => [
                    'Introduction' => [
                        'screenshots' => [
                            [
                                [
                                    'action' => 'makeScreenshotOfTable',
                                    'pid' => ['action' => 'getUidByField', 'table' => 'pages', 'field' => 'title', 'value' => 'elements rte'],
                                    'table' => "pages",
                                    'fileName' => "styleguide_root_page",
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            'basic-configuration' => $configuration->getConfig()
        ];
    }
}
