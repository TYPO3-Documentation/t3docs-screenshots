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
use TYPO3\CMS\Core\Core\ApplicationContext;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\CMS\Screenshots\Runner\Codeception\Support\Helper\Typo3CodeSnippets;
use TYPO3\CMS\Screenshots\Runner\Codeception\Support\Helper\Typo3Screenshots;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class Typo3CodeSnippetsTest extends UnitTestCase
{
    protected string $vfsPath;
    protected string $vfsPathPlaceholder = '::vfs-path::';
    protected string $fixturePath = __DIR__ . '/../../../../Fixtures';

    protected function setUp(): void
    {
        parent::setUp();

        $this->vfsPath = vfsStream::setup('public')->url();

        Environment::initialize(
            new ApplicationContext('Testing'),
            true,
            false,
            '',
            '',
            '',
            '',
            '',
            ''
        );
    }

    /**
     * @test
     * @dataProvider createCodeSnippetDataProvider
     */
    public function createCodeSnippet(string $sourceFile, string $targetFileName, string $targetFilePath, string $expected): void
    {
        $this->resolveVfsPath($sourceFile);
        $this->resolveVfsPath($targetFilePath);

        $this->createDummyCodeSnippet($sourceFile);

        $typo3CodeSnippets = $this->getTypo3CodeSnippetsMock();
        $typo3CodeSnippets->createCodeSnippet($sourceFile, $targetFileName);

        self::assertFileExists($targetFilePath);
        self::assertStringContainsString($expected, file_get_contents($targetFilePath));
    }

    public function createCodeSnippetDataProvider(): array
    {
        return [
            [
                'sourceFile' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . '/code-snippet.json',
                'targetFileName' => 'code-snippet-json',
                'targetFilePath' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'Documentation/CodeSnippets/code-snippet-json.rst.txt',
                'expected' => 'code-block:: json'
            ],
            [
                'sourceFile' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . '/code-snippet.php',
                'targetFileName' => 'code-snippet-php',
                'targetFilePath' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'Documentation/CodeSnippets/code-snippet-php.rst.txt',
                'expected' => 'code-block:: php'
            ],
            [
                'sourceFile' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . '/code-snippet.xml',
                'targetFileName' => 'code-snippet-xml',
                'targetFilePath' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'Documentation/CodeSnippets/code-snippet-xml.rst.txt',
                'expected' => 'code-block:: xml'
            ],
            [
                'sourceFile' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . '/code-snippet.yaml',
                'targetFileName' => 'code-snippet-yaml',
                'targetFilePath' => $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'Documentation/CodeSnippets/code-snippet-yaml.rst.txt',
                'expected' => 'code-block:: yaml'
            ]
        ];
    }

    /**
     * @test
     */
    public function createCodeSnippetFailsIfCodeLanguageCannotBeDetermined(): void
    {
        $sourceFile = $this->vfsPath . DIRECTORY_SEPARATOR . '/code-snippet.unknown';
        $targetFileName = 'code-snippet-unkown';

        $this->createDummyCodeSnippet($sourceFile);

        $this->expectExceptionCode(4001);

        $typo3CodeSnippets = $this->getTypo3CodeSnippetsMock();
        $typo3CodeSnippets->createCodeSnippet($sourceFile, $targetFileName);
    }

    protected function getTypo3CodeSnippetsMock(): Typo3CodeSnippets
    {
        $typo3Screenshots = new Typo3Screenshots($this->getModuleContainerStub());
        $typo3Screenshots->setScreenshotsBasePath($this->vfsPath);

        $typo3CodeSnippets = $this->getMockBuilder(Typo3CodeSnippets::class)
            ->setConstructorArgs([$this->getModuleContainerStub()])
            ->setMethods(['getTypo3Screenshots'])
            ->getMock();
        $typo3CodeSnippets->expects(self::any())->method('getTypo3Screenshots')->willReturn($typo3Screenshots);

        return $typo3CodeSnippets;
    }

    protected function getModuleContainerStub(): ModuleContainer
    {
        return $this->getMockBuilder(ModuleContainer::class)
            ->disableOriginalConstructor()
            ->getMock();
    }

    protected function resolveVfsPath(&$value): void
    {
        if (is_string($value) && strpos($value, $this->vfsPathPlaceholder) === 0) {
            $value = str_replace($this->vfsPathPlaceholder, $this->vfsPath, $value);
        }
    }

    protected function createDummyCodeSnippet(string $filePath, string $fileContent = ''): void
    {
        $fileContent = $fileContent !== '' ? $fileContent : 'I am a dummy code snippet.';
        file_put_contents($filePath, $fileContent);
    }
}
