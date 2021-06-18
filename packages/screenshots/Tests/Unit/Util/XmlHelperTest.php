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
    public function extractNodesFromXmlRemovesXmlDeclaration(): void
    {
        $xml = <<<'NOWDOC'
<?xml version="1.0"?>
<T3FlexForms/>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms/>
NOWDOC;
        $xPaths = [];

        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $xPaths)));
    }

    /**
     * @test
     */
    public function extractNodesFromXmlIncludesFullDocumentIfXPathsAreEmpty(): void
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
        $xPaths = [];

        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $xPaths)));
    }

    /**
     * @test
     */
    public function extractNodesFromXmlCanHandleMultipleXPaths(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
  <elem-2>Element 2</elem-2>
  <elem-3>Element 3</elem-3>
</T3FlexForms>
NOWDOC;
        $expected = <<<'NOWDOC'
<T3FlexForms>
  <elem-1>Element 1</elem-1>
  <elem-2>Element 2</elem-2>
</T3FlexForms>
NOWDOC;
        $xPaths = ['/T3FlexForms/elem-1', '/T3FlexForms/elem-2'];

        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $xPaths)));
    }

    /**
     * @test
     */
    public function extractNodesFromXmlCanHandleXPathMatchingMultipleNodes(): void
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
        $xPaths = ['/T3FlexForms/*'];

        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $xPaths)));
    }

    /**
     * @test
     */
    public function extractNodesFromXmlHandlesRelativeLikeAbsoluteXPath(): void
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
        $relativeXPaths = ['T3FlexForms/elem-1'];
        $absoluteXPaths = ['/T3FlexForms/elem-1'];

        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $relativeXPaths)));
        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $absoluteXPaths)));
    }

    /**
     * @test
     */
    public function extractNodesFromXmlIncludesLastNodeOfXPathWithAllPredecessorsAndDescendants(): void
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
        $xPaths = ['/T3FlexForms/elem-1'];

        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $xPaths)));
    }

    /**
     * @test
     */
    public function extractNodesFromXmlIncludesAttributesOfAllNodes(): void
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
        $xPaths = ['/T3FlexForms/elem-1/child-1'];

        self::assertEquals($expected, trim(XmlHelper::extractNodesFromXml($xml, $xPaths)));
    }

    /**
     * @test
     */
    public function extractNodesFromXmlTriggersErrorIfXmlIsEmpty(): void
    {
        $xml = '';
        $xPaths = ['/'];

        $this->expectError();
        $this->expectErrorMessage('DOMDocument::loadXML(): Empty string supplied as input');

        XmlHelper::extractNodesFromXml($xml, $xPaths);
    }

    /**
     * @test
     */
    public function extractNodesFromXmlThrowsExceptionOnParsingError(): void
    {
        $xml = '<broken';
        $xPaths = ['/'];

        $this->expectExceptionCode(4001);
        $this->expectExceptionMessage('XML Error #73: Couldn\'t find end of Start Tag broken line 1.');

        XmlHelper::extractNodesFromXml($xml, $xPaths);
    }

    /**
     * @test
     */
    public function extractNodesFromXmlThrowsExceptionIfXPathDoesNotMatchAnyNodes(): void
    {
        $xml = <<<'NOWDOC'
<T3FlexForms>
  <elem-1 attribute-1="value-1">text-1</elem-1>
</T3FlexForms>
NOWDOC;
        $xPaths = ['/T3FlexForms/elem-not-available'];

        $this->expectExceptionCode(4003);
        $this->expectExceptionMessage('XML Error: XPath "/T3FlexForms/elem-not-available" does not match any XML nodes.');

        XmlHelper::extractNodesFromXml($xml, $xPaths);
    }
}
