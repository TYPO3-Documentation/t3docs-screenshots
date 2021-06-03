<?php

declare(strict_types=1);
namespace Typo3\CMS\Screenshots\Tests\Unit\Fixtures;


/**
 * The class with comments.
 */
class ClassWithComments
{
    /**
     * @var string Property One
     */
    protected string $propertyOne;

    /**
     * @var string Property with default value
     */
    protected string $propertyWithDefaultValue = 'DefaultValue';

    /**
     * @return string
     */
    public function getPropertyOne(): string
    {
        return $this->propertyOne;
    }
}