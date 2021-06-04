<?php

declare(strict_types=1);
namespace Typo3\CMS\Screenshots\Tests\Unit\Fixtures;


use TYPO3\CMS\Screenshots\Util\ArrayHelper;
use TYPO3\CMS\Screenshots\Util\ClassHelper;
use TYPO3\CMS\Screenshots\Util\StringHelper;

class ClassWithNoComments
{
    protected const CONSTANT_ONE = 'CONSTANT_ONE';

    protected const CONSTANT_ONE_ONE = 'CONSTANT_ONE_ONE';

    protected string $propertyOne;

    protected string $propertyOneOne;

    protected string $propertyWithDefaultValue = 'DefaultValue';

    public function getPropertyOne(): string
    {
        return $this->propertyOne;
    }

    public function getPropertyOneOne(): string
    {
        return $this->propertyOneOne;
    }

    public function getPropertyWithDefaultValue(): string
    {
        return $this->propertyWithDefaultValue;
    }

    public function getArrayByPath(): array
    {
        return ArrayHelper::getArrayByPath(['columns' => ['title' => 'my-title']], 'columns/title');
    }

    public function getMultilineTextIndented(): string
    {
        return StringHelper::indentMultilineText(':alt: This is a TCA table', '   ');
    }
}