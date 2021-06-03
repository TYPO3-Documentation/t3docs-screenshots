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

use Typo3\CMS\Screenshots\Tests\Unit\Fixtures\ClassWithComments;
use Typo3\CMS\Screenshots\Tests\Unit\Fixtures\ClassWithNoComments;
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
                'class' => ClassWithComments::class,
                'expected' => <<<'NOWDOC'
/**
 * The class with comments.
 */
class ClassWithComments
{
%s
}
NOWDOC
            ],
            [
                'class' => ClassWithNoComments::class,
                'expected' => <<<'NOWDOC'
class ClassWithNoComments
{
%s
}
NOWDOC
            ]
        ];
    }

    /**
     * @test
     */
    public function getClassSignatureCanRemoveComment(): void
    {
        $class = ClassWithComments::class;
        $expected = <<<'NOWDOC'
class ClassWithComments
{
%s
}
NOWDOC;
        self::assertEquals($expected, rtrim(ClassHelper::getClassSignature($class, false)));
    }

    /**
     * @test
     */
    public function getClassSignatureThrowsReflectionExceptionIfClassDoesNotExist(): void
    {
        $class = 'ClassDoesNotExist';
        $this->expectException(\ReflectionException::class);
        ClassHelper::getClassSignature($class);
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
                'class' => ClassWithComments::class,
                'method' => 'getPropertyOne',
                'expected' => <<<'NOWDOC'
    /**
     * @return string
     */
    public function getPropertyOne(): string
    {
        return $this->propertyOne;
    }
NOWDOC
            ],
            [
                'class' => ClassWithNoComments::class,
                'method' => 'getPropertyOne',
                'expected' => <<<'NOWDOC'
    public function getPropertyOne(): string
    {
        return $this->propertyOne;
    }
NOWDOC
            ]
        ];
    }

    /**
     * @test
     */
    public function getMethodCodeCanRemoveComment(): void
    {
        $class = ClassWithComments::class;
        $method = 'getPropertyOne';
        $expected = <<<'NOWDOC'
    public function getPropertyOne(): string
    {
        return $this->propertyOne;
    }
NOWDOC;
        self::assertEquals($expected, rtrim(ClassHelper::getMethodCode($class, $method, false)));
    }

    /**
     * @test
     */
    public function getMethodCodeThrowsReflectionExceptionIfMethodDoesNotExist(): void
    {
        $class = ClassWithComments::class;
        $method = 'methodDoesNotExist';
        $this->expectException(\ReflectionException::class);
        ClassHelper::getMethodCode($class, $method);
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
                'class' => ClassWithComments::class,
                'property' => 'propertyOne',
                'expected' => <<<'NOWDOC'
    /**
     * @var string Property One
     */
    protected string $propertyOne;
NOWDOC
            ],
            [
                'class' => ClassWithComments::class,
                'property' => 'propertyWithDefaultValue',
                'expected' => <<<'NOWDOC'
    /**
     * @var string Property with default value
     */
    protected string $propertyWithDefaultValue = 'DefaultValue';
NOWDOC
            ],
            [
                'class' => ClassWithNoComments::class,
                'property' => 'propertyOne',
                'expected' => <<<'NOWDOC'
    protected string $propertyOne;
NOWDOC
            ]
        ];
    }

    /**
     * @test
     */
    public function getPropertyCodeCanRemoveComment(): void
    {
        $class = ClassWithComments::class;
        $property = 'propertyOne';
        $expected = <<<'NOWDOC'
    protected string $propertyOne;
NOWDOC;
        self::assertEquals($expected, rtrim(ClassHelper::getPropertyCode($class, $property, false)));
    }

    /**
     * @test
     */
    public function getPropertyCodeThrowsReflectionExceptionIfPropertyDoesNotExist(): void
    {
        $class = ClassWithComments::class;
        $property = 'propertyDoesNotExist';
        $this->expectException(\ReflectionException::class);
        ClassHelper::getMethodCode($class, $property);
    }
}
