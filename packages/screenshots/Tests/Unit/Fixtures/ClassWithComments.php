<?php

declare(strict_types=1);
namespace Typo3\CMS\Screenshots\Tests\Unit\Fixtures;


use TYPO3\CMS\Screenshots\Util\ArrayHelper;
use TYPO3\CMS\Screenshots\Util\ClassHelper;
use TYPO3\CMS\Screenshots\Util\StringHelper;

/**
 * The class with comments.
 */
class ClassWithComments
{
    /**
     * This is constant CONSTANT_ONE.
     */
    protected const CONSTANT_ONE = 'CONSTANT_ONE';

    /**
     * This is constant CONSTANT_ONE_ONE.
     */
    protected const CONSTANT_ONE_ONE = 'CONSTANT_ONE_ONE';

    /**
     * @var string Property One
     */
    protected string $propertyOne;

    /**
     * @var string Property One One
     */
    protected string $propertyOneOne;

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

    /**
     * @return string
     */
    public function getPropertyOneOne(): string
    {
        return $this->propertyOneOne;
    }

    /**
     * @return string
     */
    public function getPropertyWithDefaultValue(): string
    {
        return $this->propertyWithDefaultValue;
    }

    /**
     * @return array
     */
    public function getArrayByPath(): array
    {
        return ArrayHelper::getArrayByPath(['columns' => ['title' => 'my-title']], 'columns/title');
    }

    /**
     * @return string
     */
    public function getMultilineTextIndented(): string
    {
        return StringHelper::indentMultilineText(':alt: This is a TCA table', '   ');
    }
}