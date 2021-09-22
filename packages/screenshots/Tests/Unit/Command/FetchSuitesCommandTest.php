<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Tests\Unit\Command;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use org\bovigo\vfs\vfsStream;
use Symfony\Component\Console\Tester\CommandTester;
use TYPO3\Documentation\Screenshots\Command\FetchSuitesCommand;
use TYPO3\Documentation\Screenshots\Configuration\Configuration;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class FetchSuitesCommandTest extends UnitTestCase
{
    protected $resetSingletonInstances = true;

    /**
     * @test
     */
    public function fetchSuitesCommandReturnsProperJson(): void
    {
        $vfsPath = vfsStream::setup('public')->url();

        $configuration = new Configuration();
        $configuration->createBasicConfig();
        file_put_contents($vfsPath . '/screenshots.json', json_encode($configuration->getConfig()));

        $tester = new CommandTester(new FetchSuitesCommand());
        $tester->execute(['--target-path' => $vfsPath], []);

        self::assertEquals(0, $tester->getStatusCode());
        self::assertEquals(
            [
                ['path' => $vfsPath, 'suiteId' => 'Core'],
                ['path' => $vfsPath, 'suiteId' => 'Examples'],
                ['path' => $vfsPath, 'suiteId' => 'Install'],
                ['path' => $vfsPath, 'suiteId' => 'Introduction'],
                ['path' => $vfsPath, 'suiteId' => 'SitePackage'],
                ['path' => $vfsPath, 'suiteId' => 'Styleguide'],
            ],
            json_decode($tester->getDisplay(), true)
        );
    }

    /**
     * @test
     */
    public function fetchSuitesCommandDisplaysExceptionIfJsonIsMalformed(): void
    {
        $vfsPath = vfsStream::setup('public')->url();

        file_put_contents($vfsPath . '/screenshots.json', "{'i-am-a': 'malformed-json',}");

        $tester = new CommandTester(new FetchSuitesCommand());
        $tester->execute(['--target-path' => $vfsPath], []);

        self::assertEquals(1, $tester->getStatusCode());
        self::assertEquals(
            '[ERROR] 4: Syntax error in vfs://public/screenshots.json',
            trim($tester->getDisplay())
        );
    }
}
