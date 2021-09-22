<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Tests\Unit\Runner\Codeception\Support\Helper;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Codeception\Lib\ModuleContainer;
use TYPO3\Documentation\Screenshots\Runner\Codeception\Support\Helper\Typo3Cli;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class Typo3CliTest extends UnitTestCase
{
    /**
     * @test
     */
    public function getUidByField(): void
    {
        $typo3Cli = $this->getTypo3CliMock();
        $typo3Cli->expects(self::once())->method('fetchMappings')->willReturn([
            0,
            explode("\n", json_encode([
                "0" => 1,
                "1" => 2,
                "6" => 7,
                "7" => 8,
            ], JSON_PRETTY_PRINT))
        ]);
        $uid = $typo3Cli->getUidByField('pages', 'pid', 1);

        self::assertEquals(2, $uid);
    }

    /**
     * @test
     */
    public function getUidByFieldThrowsExceptionIfMappingsJsonIsMalformed(): void
    {
        $typo3Cli = $this->getTypo3CliMock();
        $typo3Cli->expects(self::once())->method('fetchMappings')->willReturn([
            0,
            explode("\n", json_encode([
                "0" => 1,
                "1" => 2,
                "6" => 7,
                "7" => 8,
            ], JSON_PRETTY_PRINT) . ',')
        ]);

        $this->expectException(\Exception::class);
        $this->expectExceptionMessage('JSON Error #4: Syntax error');

        $typo3Cli->getUidByField('pages', 'pid', 1);
    }

    /**
     * @test
     */
    public function getUidByFieldThrowsExceptionIfFetchingOfMappingsFails(): void
    {
        $typo3Cli = $this->getTypo3CliMock();
        $typo3Cli->expects(self::once())->method('fetchMappings')->willReturn([1, ['Failed']]);

        $this->expectException(\Exception::class);
        $this->expectExceptionMessage('TYPO3 Cli Error #1: Failed');

        $typo3Cli->getUidByField('pages', 'pid', 1);
    }

    protected function getTypo3CliMock(): Typo3Cli
    {
        $typo3Cli = $this->getMockBuilder(Typo3Cli::class)
            ->setConstructorArgs([$this->getModuleContainerStub()])
            ->onlyMethods(['fetchMappings'])
            ->getMock();

        return $typo3Cli;
    }

    protected function getModuleContainerStub(): ModuleContainer
    {
        return $this->getMockBuilder(ModuleContainer::class)
            ->disableOriginalConstructor()
            ->getMock();
    }
}
