<?php

declare(strict_types=1);
namespace Typo3\CMS\Screenshots\Tests\Unit\Fixtures;


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
}