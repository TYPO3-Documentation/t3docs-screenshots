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

use TYPO3\CMS\Screenshots\Util\XmlHelper;
use TYPO3\TestingFramework\Core\Unit\UnitTestCase;

class XmlHelperTest extends UnitTestCase
{
    /**
     * @test
     */
    public function getXmlByPathRemovesXmlDeclaration(): void
    {
        $xml = <<<'NOWDOC'
<?xml version="1.0"?>
<T3FlexForms/>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms/>
NOWDOC;
        $path = '';

        self::assertEquals($expected, trim(XmlHelper::getXmlByPath($xml, $path)));
    }

    /**
     * @test
     */
    public function getXmlByPathIncludesFullDocumentIfPathIsEmpty(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $path = '';

        self::assertEquals($expected, trim(XmlHelper::getXmlByPath($xml, $path)));
    }

    /**
     * @test
     */
    public function getXmlByPathCanHandlePathMatchingMultipleNodes(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $path = '/T3FlexForms/*';

        self::assertEquals($expected, trim(XmlHelper::getXmlByPath($xml, $path)));
    }

    /**
     * @test
     */
    public function getXmlByPathHandlesRelativeLikeAbsolutePath(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
</T3FlexForms>
NOWDOC;
        $relativePath = 'T3FlexForms/elem-1';
        $absolutePath = '/T3FlexForms/elem-1';

        self::assertEquals($expected, trim(XmlHelper::getXmlByPath($xml, $relativePath)));
        self::assertEquals($expected, trim(XmlHelper::getXmlByPath($xml, $absolutePath)));
    }

    /**
     * @test
     */
    public function getXmlByPathIncludesLastNodeOfPathWithAllPredecessorsAndDescendants(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>
    <child-1>Child 1</child-1>
    <child-2>Child 2</child-2>
  </elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>
    <child-1>Child 1</child-1>
    <child-2>Child 2</child-2>
  </elem-1>
</T3FlexForms>
NOWDOC;
        $path = '/T3FlexForms/elem-1';

        self::assertEquals($expected, trim(XmlHelper::getXmlByPath($xml, $path)));
    }

    /**
     * @test
     */
    public function getXmlByPathIncludesAttributesOfAllNodes(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms attribute-1="value-1">
  <elem-1 attribute-2="value-2">
    <child-1 attribute-3="value-3">Child 1</child-1>
    <child-2>Child 2</child-2>
  </elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms attribute-1="value-1">
  <elem-1 attribute-2="value-2">
    <child-1 attribute-3="value-3">Child 1</child-1>
  </elem-1>
</T3FlexForms>
NOWDOC;
        $path = '/T3FlexForms/elem-1/child-1';

        self::assertEquals($expected, trim(XmlHelper::getXmlByPath($xml, $path)));
    }

    /**
     * @test
     */
    public function getXmlByPathTriggersErrorIfXmlIsEmpty(): void
    {
        $xml = '';
        $path = '/';

        $this->expectError();
        $this->expectErrorMessage('DOMDocument::loadXML(): Empty string supplied as input');

        XmlHelper::getXmlByPath($xml, $path);
    }

    /**
     * @test
     */
    public function getXmlByPathThrowsExceptionOnParsingError(): void
    {
        $xml = '<broken';
        $path = '/';

        $this->expectExceptionCode(4001);
        $this->expectExceptionMessage('XML Error #73: Couldn\'t find end of Start Tag broken line 1.');

        XmlHelper::getXmlByPath($xml, $path);
    }

    /**
     * @test
     */
    public function getXmlByPathThrowsExceptionIfPathDoesNotMatchAnyNodes(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms>
  <elem-1 attribute-1="value-1">text-1</elem-1>
</T3FlexForms>
NOWDOC;
        $path = '/T3FlexForms/elem-not-available';

        $this->expectExceptionCode(4003);
        $this->expectExceptionMessage('XML Error: Path "/T3FlexForms/elem-not-available" does not match any XML nodes.');

        XmlHelper::getXmlByPath($xml, $path);
    }
}
