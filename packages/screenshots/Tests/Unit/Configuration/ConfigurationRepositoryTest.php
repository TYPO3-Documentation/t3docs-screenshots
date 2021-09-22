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
use TYPO3\Documentation\Screenshots\Configuration\ConfigurationRepository;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class ConfigurationRepositoryTest extends UnitTestCase
{
    /**
     * @test
     */
    public function findAll(): void
    {
        $GLOBALS['TYPO3_CONF_VARS']['SYS']['folderCreateMask'] = '0770';
        $root = vfsStream::setup('t3docs');

        $pathA = $root->url() . DIRECTORY_SEPARATOR . 'configurationA';
        $configurationA = new Configuration($pathA);
        $configurationA->createBasicConfig();
        $configurationA->write();

        $pathB = $root->url() . DIRECTORY_SEPARATOR . 'configurationB';
        $configurationB = new Configuration($pathB);
        $configurationB->write();

        self::assertFileExists($configurationA->getFilePath());
        self::assertFileExists($configurationB->getFilePath());

        $configurationRepository = new ConfigurationRepository($root->url());
        $configurationsActual = $configurationRepository->findAll();
        foreach ($configurationsActual as &$configuration) {
            $configuration->read();
        }

        $configurationsExpected = [$configurationA, $configurationB];
        self::assertEquals($configurationsExpected, $configurationsActual);
    }

    /**
     * @test
     */
    public function findByPath(): void
    {
        $GLOBALS['TYPO3_CONF_VARS']['SYS']['folderCreateMask'] = '0770';
        $root = vfsStream::setup('t3docs');

        $pathA = $root->url() . DIRECTORY_SEPARATOR . 'configurationA';
        $configurationA = new Configuration($pathA);
        $configurationA->write();

        $pathB = $root->url() . DIRECTORY_SEPARATOR . 'configurationB';
        $configurationB = new Configuration($pathB);
        $configurationB->write();

        self::assertFileExists($configurationA->getFilePath());
        self::assertFileExists($configurationB->getFilePath());

        $configurationRepository = new ConfigurationRepository($root->url());
        $configurationsActual = $configurationRepository->findByPath($pathA);

        $configurationsExpected = [$configurationA];
        self::assertEquals($configurationsExpected, $configurationsActual);
    }
}
