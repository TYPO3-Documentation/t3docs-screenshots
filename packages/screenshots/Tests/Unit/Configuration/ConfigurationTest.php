<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Tests\Unit\Configuration;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use org\bovigo\vfs\vfsStream;
use TYPO3\Documentation\Screenshots\Configuration\Configuration;
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

    /**
     * @test
     */
    public function prepareConfigResolvesIncludesAndRemovesNotExecutableActionsIds(): void
    {
        $config = [
            'suites' => [
                'Introduction' => [
                    'screenshots' => [
                        '_include_1' => [
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "introduction_dashboard_1"]
                        ],
                        '_include_2' => [
                            ['include' => '_include_1'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "introduction_dashboard_2"]
                        ],
                        'run' => [
                            ['include' => '_include_2']
                        ]
                    ]
                ]
            ]
        ];
        $expected = [
            'suites' => [
                'Introduction' => [
                    'screenshots' => [
                        'run' => [
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "introduction_dashboard_1"],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "introduction_dashboard_2"]
                        ]
                    ]
                ]
            ]
        ];

        $configuration = new Configuration();
        $configuration->setConfig($config);

        self::assertEquals($config, $configuration->getConfig());
        self::assertEquals($expected, $configuration->getConfigPrepared());
    }

    /**
     * @test
     */
    public function isExistingAdaptsAfterWritingTheConfiguration(): void
    {
        $GLOBALS['TYPO3_CONF_VARS']['SYS']['folderCreateMask'] = '0770';
        $root = vfsStream::setup('t3docs');

        $configuration = new Configuration($root->url());
        self::assertFileDoesNotExist($configuration->getFilePath());
        self::assertFalse($configuration->isExisting());

        $configuration->write();
        self::assertFileExists($configuration->getFilePath());
        self::assertTrue($configuration->isExisting());
    }

    /**
     * @test
     */
    public function getSelectableActionsIds(): void
    {
        $configuration = new Configuration('DummyPath');
        $configuration->createBasicConfig();
        $actualActionsIds = $configuration->getSelectableActionsIds();
        $expectedActionsIds = [
            'actionsIdentifierExamplesFrontend',
            'actionsIdentifierExamplesBackend',
            'actionsIdentifierExtensionBuilder',
            'actionsIdentifierIntroductionFrontend',
            'actionsIdentifierIntroductionBackend',
            'actionsIdentifierIntroductionUserSwitch',
            'actionsIdentifierSitePackageBackend',
            'actionsIdentifierStyleguideScreenshots',
            'actionsIdentifierStyleguideScreenshotsOfContentFrameOnly',
            'actionsIdentifierStyleguideCodeSnippets',
            'actionsIdentifierStyleguideDraw',
            'actionsIdentifierStyleguideCrop',
        ];
        self::assertEquals($expectedActionsIds, $actualActionsIds);
    }
}
