<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Unit\Runner\Codeception\Support\Helper;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Codeception\Lib\ModuleContainer;
use org\bovigo\vfs\vfsStream;
use TYPO3\CMS\Screenshots\Runner\Codeception\Support\Helper\Typo3Screenshots;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class Typo3ScreenshotsTest extends UnitTestCase
{
    protected string $vfsPath;
    protected string $fixturePath = __DIR__ . '/../../../../Fixtures';

    protected function setUp(): void
    {
        parent::setUp();

        $this->vfsPath = vfsStream::setup('public')->url();
    }

    /**
     * @test
     */
    public function cropScreenshot(): void
    {
        $fileName = 'screenshot-actual.png';
        $width = 150;
        $height = 100;

        $sourcePath = $this->fixturePath . DIRECTORY_SEPARATOR . $fileName;
        $targetPaths = [
            sprintf('%s-%s.png',
                $this->vfsPath . DIRECTORY_SEPARATOR . pathinfo($fileName, PATHINFO_FILENAME),
                Typo3Screenshots::POSITION_LEFT_TOP
            ),
            sprintf('%s-%s.png',
                $this->vfsPath . DIRECTORY_SEPARATOR . pathinfo($fileName, PATHINFO_FILENAME),
                Typo3Screenshots::POSITION_LEFT_BOTTOM
            ),
            sprintf('%s-%s.png',
                $this->vfsPath . DIRECTORY_SEPARATOR . pathinfo($fileName, PATHINFO_FILENAME),
                Typo3Screenshots::POSITION_RIGHT_TOP
            ),
            sprintf('%s-%s.png',
                $this->vfsPath . DIRECTORY_SEPARATOR . pathinfo($fileName, PATHINFO_FILENAME),
                Typo3Screenshots::POSITION_RIGHT_BOTTOM
            )
        ];

        copy($sourcePath, $targetPaths[0]);
        copy($sourcePath, $targetPaths[1]);
        copy($sourcePath, $targetPaths[2]);
        copy($sourcePath, $targetPaths[3]);

        $typo3Screenshots = $this->getTypo3ScreenshotsMock();
        $typo3Screenshots->setScreenshotsBasePath($this->vfsPath);
        $typo3Screenshots->setScreenshotsDocumentationPath("");
        $typo3Screenshots->setScreenshotsImagePath("");

        $typo3Screenshots->cropScreenshot(
            pathinfo($targetPaths[0], PATHINFO_FILENAME), Typo3Screenshots::POSITION_LEFT_TOP, $width, $height
        );
        $typo3Screenshots->cropScreenshot(
            pathinfo($targetPaths[1], PATHINFO_FILENAME), Typo3Screenshots::POSITION_LEFT_BOTTOM, $width, $height
        );
        $typo3Screenshots->cropScreenshot(
            pathinfo($targetPaths[2], PATHINFO_FILENAME), Typo3Screenshots::POSITION_RIGHT_TOP, $width, $height
        );
        $typo3Screenshots->cropScreenshot(
            pathinfo($targetPaths[3], PATHINFO_FILENAME), Typo3Screenshots::POSITION_RIGHT_BOTTOM, $width, $height
        );

        self::assertEquals([$width, $height], array_slice(getimagesize($targetPaths[0]), 0, 2));
        self::assertEquals([$width, $height], array_slice(getimagesize($targetPaths[1]), 0, 2));
        self::assertEquals([$width, $height], array_slice(getimagesize($targetPaths[2]), 0, 2));
        self::assertEquals([$width, $height], array_slice(getimagesize($targetPaths[3]), 0, 2));

        self::assertFileNotEquals($targetPaths[0], $targetPaths[1]);
        self::assertFileNotEquals($targetPaths[0], $targetPaths[2]);
        self::assertFileNotEquals($targetPaths[0], $targetPaths[3]);
    }

    protected function getTypo3ScreenshotsMock(): Typo3Screenshots
    {
        $typo3Screenshots = $this->getMockBuilder(Typo3Screenshots::class)
            ->setConstructorArgs([$this->getModuleContainerStub()])
            ->addMethods(['dummy'])
            ->getMock();

        return $typo3Screenshots;
    }

    protected function getModuleContainerStub(): ModuleContainer
    {
        return $this->getMockBuilder(ModuleContainer::class)
            ->disableOriginalConstructor()
            ->getMock();
    }
}
