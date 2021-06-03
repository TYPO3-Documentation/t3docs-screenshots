<?php

declare(strict_types=1);
namespace Typo3\CMS\Screenshots\Tests\Unit\Fixtures;


class ClassWithNoComments
{
    protected string $propertyOne;

    public function getPropertyOne(): string
    {
        return $this->propertyOne;
    }
}