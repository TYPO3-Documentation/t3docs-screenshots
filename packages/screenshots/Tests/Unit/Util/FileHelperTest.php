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

use org\bovigo\vfs\vfsStream;
use TYPO3\Documentation\Screenshots\Util\FileHelper;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class FileHelperTest extends UnitTestCase
{
    /**
     * @test
     */
    public function getFoldersRecursively(): void
    {
        $folderTree = [
            'FolderA' => [],
            'FolderB' => [
                'SubFolderA' => []
            ],
        ];
        $expected = [
            'vfs://t3docs/FolderA',
            'vfs://t3docs/FolderB',
            'vfs://t3docs/FolderB/SubFolderA',
        ];

        $root = vfsStream::setup('t3docs', null, $folderTree);
        $actual = FileHelper::getFoldersRecursively($root->url());

        self::assertEquals($expected, $actual);
    }

    /**
     * @test
     */
    public function getFoldersRecursivelyHandlesMissingRootFolder(): void
    {
        $root = vfsStream::setup('t3docs');
        $actual = FileHelper::getFoldersRecursively($root->url() . '/FolderDoesNotExist');

        self::assertEquals([], $actual);
    }

    /**
     * @test
     */
    public function getSubFolders(): void
    {
        $folderTree = [
            'FolderA' => [],
            'FolderB' => [
                'SubFolderA' => []
            ],
        ];
        $expected = [
            'vfs://t3docs/FolderA',
            'vfs://t3docs/FolderB',
        ];

        $root = vfsStream::setup('t3docs', null, $folderTree);
        $actual = FileHelper::getSubFolders($root->url());

        self::assertEquals($expected, $actual);
    }

    /**
     * @test
     */
    public function getFilesByNameRecursively(): void
    {
        $folderTree = [
            'FolderA' => [
                'fileA.txt' => 'fileContentA'
            ],
            'FolderB' => [
                'SubFolderA' => [
                    'fileA.txt' => 'fileContentA'
                ]
            ],
            'fileA.txt' => 'fileContentA',
        ];
        $expected = [
            'vfs://t3docs/FolderA/fileA.txt',
            'vfs://t3docs/FolderB/SubFolderA/fileA.txt',
            'vfs://t3docs/fileA.txt',
        ];

        $root = vfsStream::setup('t3docs', null, $folderTree);
        $actual = FileHelper::getFilesByNameRecursively('fileA.txt', $root->url());

        self::assertEquals($expected, $actual);
    }

    /**
     * @test
     */
    public function deleteRecursively(): void
    {
        $folderTree = [
            'FolderA' => [],
            'FolderB' => [
                'SubFolderA' => [
                    'fileA.txt' => 'fileContentA',
                    'fileB.txt' => 'fileContentB',
                ]
            ],
        ];

        $root = vfsStream::setup('t3docs', null, $folderTree);
        self::assertDirectoryExists($root->url());
        FileHelper::deleteRecursively($root->url());
        self::assertDirectoryDoesNotExist($root->url());
    }

    /**
     * @test
     * @dataProvider getPathBySegmentsDataProvider
     */
    public function getPathBySegments(array $segments, string $expected): void
    {
        self::assertEquals($expected, FileHelper::getPathBySegments(...$segments));
    }

    public function getPathBySegmentsDataProvider(): array
    {
        return [
            [
                'segments' => ['/absolute-path', '', 'relative-path/folder'],
                'expected' => DIRECTORY_SEPARATOR . 'absolute-path' . DIRECTORY_SEPARATOR . 'relative-path' . DIRECTORY_SEPARATOR . 'folder'
            ],
            [
                'segments' => ['relative-path/', '/', '/folder/'],
                'expected' => 'relative-path' . DIRECTORY_SEPARATOR . 'folder'
            ]
        ];
    }

    /**
     * @test
     * @dataProvider getUrlBySegmentsDataProvider
     */
    public function getUrlBySegments(array $segments, string $expected): void
    {
        self::assertEquals($expected, FileHelper::getUrlBySegments(...$segments));
    }

    public function getUrlBySegmentsDataProvider(): array
    {
        return [
            [
                'segments' => ['https://', '', 'relative-path/folder'],
                'expected' => 'https://relative-path/folder'
            ],
            [
                'segments' => ['https://absolute-path', '', 'relative-path/folder'],
                'expected' => 'https://absolute-path/relative-path/folder'
            ],
            [
                'segments' => ['/', '', 'relative-path/folder'],
                'expected' => '/relative-path/folder'
            ],
            [
                'segments' => ['/absolute-path', '', 'relative-path/folder'],
                'expected' => '/absolute-path/relative-path/folder'
            ],
            [
                'segments' => ['relative-path/', '/', '/folder/'],
                'expected' => 'relative-path/folder'
            ]
        ];
    }
}
