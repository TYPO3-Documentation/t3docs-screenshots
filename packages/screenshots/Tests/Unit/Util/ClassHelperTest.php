<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Unit\Util;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Screenshots\Util\ClassHelper;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class ClassHelperTest extends UnitTestCase
{
    /**
     * @test
     * @dataProvider getClassSignaturePrintsSignatureAsIsInFileDataProvider
     */
    public function getClassSignaturePrintsSignatureAsIsInFile(string $class, string $expected): void
    {
        self::assertEquals($expected, rtrim(ClassHelper::getClassSignature($class)));
    }

    public function getClassSignaturePrintsSignatureAsIsInFileDataProvider(): array
    {
        return [
            [
                'class' => \TYPO3\CMS\Core\Core\ApplicationContext::class,
                'expected' => <<<'NOWDOC'
/**
 * The TYPO3 Context object.
 *
 * A TYPO3 Application context is something like "Production", "Development",
 * "Production/StagingSystem", and is set using the TYPO3_CONTEXT environment variable.
 *
 * A context can contain arbitrary sub-contexts, which are delimited with slash
 * ("Production/StagingSystem", "Production/Staging/Server1"). The top-level
 * contexts, however, must be one of "Testing", "Development" and "Production".
 *
 * Mainly, you will use $context->isProduction(), $context->isTesting() and
 * $context->isDevelopment() inside your custom code.
 *
 * This class is derived from the TYPO3 Flow framework.
 * Credits go to the respective authors.
 */
class ApplicationContext
{
%s
}
NOWDOC
            ],
            [
                'class' => \TYPO3\CMS\Core\Core\BootService::class,
                'expected' => <<<'NOWDOC'
/**
 * @internal This is NOT an API class, it is for internal use in TYPO3 core only.
 */
class BootService
{
%s
}
NOWDOC
            ]
        ];
    }

    /**
     * @test
     * @dataProvider getMethodCodePrintsCodeAsIsInFileDataProvider
     */
    public function getMethodCodePrintsCodeAsIsInFile(string $class, string $method, string $expected): void
    {
        self::assertEquals($expected, rtrim(ClassHelper::getMethodCode($class, $method)));
    }

    public function getMethodCodePrintsCodeAsIsInFileDataProvider(): array
    {
        return [
            [
                'class' => \TYPO3\CMS\Core\Core\ApplicationContext::class,
                'method' => '__toString',
                'expected' => <<<'NOWDOC'
    /**
     * Returns the full context string, for example "Development", or "Production/LiveSystem"
     *
     * @return string
     */
    public function __toString()
    {
        return $this->contextString;
    }
NOWDOC
            ],
            [
                'class' => \TYPO3\CMS\Core\Core\BootService::class,
                'method' => 'getContainer',
                'expected' => <<<'NOWDOC'
    public function getContainer(bool $allowCaching = true): ContainerInterface
    {
        return $this->container ?? $this->prepareContainer($allowCaching);
    }
NOWDOC
            ]
        ];
    }

    /**
     * @test
     * @dataProvider getPropertyCodePrintsCodeAsIsInFileDataProvider
     */
    public function getPropertyCodePrintsCodeAsIsInFile(string $class, string $property, string $expected): void
    {
        self::assertEquals($expected, rtrim(ClassHelper::getPropertyCode($class, $property)));
    }

    public function getPropertyCodePrintsCodeAsIsInFileDataProvider(): array
    {
        return [
            [
                'class' => \TYPO3\CMS\Core\Core\ApplicationContext::class,
                'property' => 'contextString',
                'expected' => <<<'NOWDOC'
    /**
     * The (internal) context string; could be something like "Development" or "Development/MyLocalMacBook"
     *
     * @var string
     */
    protected $contextString;
NOWDOC
            ],
            [
                'class' => \TYPO3\CMS\Core\Core\BootService::class,
                'property' => 'container',
                'expected' => <<<'NOWDOC'
    private ?ContainerInterface $container = null;
NOWDOC
            ]
        ];
    }
}
