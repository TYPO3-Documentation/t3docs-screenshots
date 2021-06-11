<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Unit\Command;

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
use TYPO3\CMS\Screenshots\Command\FetchSuitesCommand;
use TYPO3\CMS\Screenshots\Configuration\Configuration;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class FetchSuitesCommandTest extends UnitTestCase
{
    protected $resetSingletonInstances = true;

    /**
     * @test
     */
    public function exportCommandReturnsProperJson(): void
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
                ['path' => $vfsPath, 'suiteId' => 'Styleguide'],
            ],
            json_decode($tester->getDisplay(), true)
        );
    }
}
