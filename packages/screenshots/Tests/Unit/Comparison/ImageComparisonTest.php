<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Tests\Unit\Comparison;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use org\bovigo\vfs\vfsStream;
use TYPO3\CMS\Core\Core\ApplicationContext;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\Documentation\Screenshots\Comparison\ImageComparison;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class ImageComparisonTest extends UnitTestCase
{
    protected string $vfsPath;
    protected string $vfsPathPlaceholder = '::vfs-path::';
    protected string $fixturePath = __DIR__ . '/../Fixtures';

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
     * @dataProvider resolveDataProvider
     *
     * @param array $config
     * @param array $expected
     */
    public function resolve(array $config, array $expected): void
    {
        array_walk($config, [$this, 'resolveVfsPath']);

        $comparison = new ImageComparison(...$config);
        $comparison->process();

        self::assertEquals($expected['difference'], $comparison->getDifference());
        self::assertEquals($expected['maxHeight'], $comparison->getMaxHeight());
        self::assertEquals($expected['imageActualExists'], $comparison->getImageActual()->isExisting());
        self::assertEquals($expected['imageOriginalExists'], $comparison->getImageOriginal()->isExisting());
        self::assertEquals($expected['imageDiffExists'], $comparison->getImageDiff()->isExisting());
        self::assertMatchesRegularExpression($expected['imageActualUrlWithCacheBust'], $comparison->getImageActual()->getUriWithCacheBust());
        self::assertMatchesRegularExpression($expected['imageOriginalUrlWithCacheBust'], $comparison->getImageOriginal()->getUriWithCacheBust());
        self::assertMatchesRegularExpression($expected['imageDiffUrlWithCacheBust'], $comparison->getImageDiff()->getUriWithCacheBust());
    }

    protected function resolveVfsPath(&$value): void
    {
        if (is_string($value) && strpos($value, $this->vfsPathPlaceholder) === 0) {
            $value = str_replace($this->vfsPathPlaceholder, $this->vfsPath, $value);
        }
    }

    public function resolveDataProvider(): array
    {
        return [
            'original-image-does-not-exist' => [
                [
                    $this->fixturePath . DIRECTORY_SEPARATOR . 'screenshot-actual.png',
                    $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'screenshot-original.png',
                    $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'diff.png',
                    '/screenshot-actual.png',
                    '/screenshot-original.png',
                    '/diff.png',
                    0.0002,
                ],
                [
                    'difference' => 1,
                    'maxHeight' => 639,
                    'imageActualExists' => true,
                    'imageOriginalExists' => false,
                    'imageDiffExists' => false,
                    'imageActualUrlWithCacheBust' => '#^/screenshot-actual.png\?bust=[0-9]+$#',
                    'imageOriginalUrlWithCacheBust' => '#^/screenshot-original.png$#',
                    'imageDiffUrlWithCacheBust' => '#^/diff.png$#',
                ]
            ],
            'original-and-actual-differ' => [
                [
                    $this->fixturePath . DIRECTORY_SEPARATOR . 'screenshot-actual.png',
                    $this->fixturePath . DIRECTORY_SEPARATOR . 'screenshot-original.png',
                    $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'diff.png',
                    '/screenshot-actual.png',
                    '/screenshot-original.png',
                    '/diff.png',
                    0.0002,
                ],
                [
                    'difference' => 0.0521537571576801,
                    'maxHeight' => 1360,
                    'imageActualExists' => true,
                    'imageOriginalExists' => true,
                    'imageDiffExists' => true,
                    'imageActualUrlWithCacheBust' => '#^/screenshot-actual.png\?bust=[0-9]+$#',
                    'imageOriginalUrlWithCacheBust' => '#^/screenshot-original.png\?bust=[0-9]+$#',
                    'imageDiffUrlWithCacheBust' => '#^/diff.png\?bust=[0-9]+$#',
                ]
            ],
            'both-images-match' => [
                [
                    $this->fixturePath . DIRECTORY_SEPARATOR . 'screenshot-actual.png',
                    $this->fixturePath . DIRECTORY_SEPARATOR . 'screenshot-actual.png',
                    $this->vfsPathPlaceholder . DIRECTORY_SEPARATOR . 'diff.png',
                    '/screenshot-actual.png',
                    '/screenshot-original.png',
                    '/diff.png',
                    0.0002,
                ],
                [
                    'difference' => 0,
                    'maxHeight' => 639,
                    'imageActualExists' => true,
                    'imageOriginalExists' => true,
                    'imageDiffExists' => false,
                    'imageActualUrlWithCacheBust' => '#^/screenshot-actual.png\?bust=[0-9]+$#',
                    'imageOriginalUrlWithCacheBust' => '#^/screenshot-original.png\?bust=[0-9]+$#',
                    'imageDiffUrlWithCacheBust' => '#^/diff.png$#',
                ]
            ]
        ];
    }
}
