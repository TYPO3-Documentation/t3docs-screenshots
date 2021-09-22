<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Util;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

class XmlHelper
{
    protected static bool $originalUseInternalErrors;

    /**
     * Extract nodes from XML, e.g.
     *
     * Input:
     * <?xml version="1.0"?>
     * <T3FlexForms>
     *  <elem-1>
     *      <child-1>Child 1</child-1>
     *      <child-2>Child 2</child-2>
     *      <child-3>Child 3</child-3>
     *  </elem-1>
     *  <elem-2>Element 2</elem-2>
     * </T3FlexForms>
     *
     * XPaths: ["/T3FlexForms/elem-1/child-1", "/T3FlexForms/elem-1/child-2"]
     *
     * Output:
     * <T3FlexForms>
     *  <elem-1>
     *      <child-1>Child 1</child-1>
     *      <child-2>Child 2</child-2>
     *  </elem-1>
     * </T3FlexForms>
     *
     * @param string $xml
     * @param array $xPaths
     * @return string
     *
     * @throws \DOMException
     * @throws \Exception
     */
    public static function extractNodesFromXml(string $xml, array $xPaths): string
    {
        self::startCollectingXmlErrors();

        if (empty($xPaths)) {
            $xPaths = ['/'];
        }

        $documentIn = new \DOMDocument();
        $documentOut = new \DOMDocument();
        $documentOut->formatOutput = true;
        $rootNodeOut = $documentOut->appendChild($documentOut->createElement('root'));

        /** @var \DOMNode $node */
        if ($documentIn->loadXML($xml)) {
            $domXPath = new \DOMXPath($documentIn);
            foreach ($xPaths as $xPath) {
                $xPath = self::getValidXPath($xPath);
                $nodeList = $domXPath->query($xPath);
                if (is_object($nodeList)) {
                    if ($nodeList->count() > 0) {
                        foreach ($nodeList as $node) {
                            if ($node->nodeType === XML_DOCUMENT_NODE) {
                                self::appendNodeDescendants($rootNodeOut, $node);
                            } elseif ($node->nodeType === XML_ELEMENT_NODE) {
                                self::appendNodeWithPredecessorsAndDescendants($rootNodeOut, $node);
                            }
                        }
                    } else {
                        self::stopCollectingXmlErrors();
                        throw new \Exception(self::printError(
                            sprintf('XPath "%s" does not match any XML nodes.', $xPath)),
                            4003
                        );
                    }
                } else {
                    $errors = self::stopCollectingXmlErrors();
                    throw new \Exception(self::printXmlErrors($errors), 4002);
                }
            }
        } else {
            $errors = self::stopCollectingXmlErrors();
            throw new \Exception(self::printXmlErrors($errors), 4001);
        }

        $result = self::saveXmlOfNodeDescendants($rootNodeOut);

        self::stopCollectingXmlErrors();

        return $result;
    }

    protected static function getValidXPath(string $xPath): string
    {
        return empty($xPath) || substr($xPath, 0, 1) !== '/' ? '/' . $xPath : $xPath;
    }

    protected static function startCollectingXmlErrors(): void
    {
        $actualUseInternalErrors = true;
        self::$originalUseInternalErrors = libxml_use_internal_errors($actualUseInternalErrors);
    }

    /**
     * @return \LibXMLError[]
     */
    protected static function stopCollectingXmlErrors(): array
    {
        $errors = libxml_get_errors();
        libxml_clear_errors();
        libxml_use_internal_errors(self::$originalUseInternalErrors);
        return $errors;
    }

    protected static function appendNodeWithPredecessorsAndDescendants(\DOMNode &$rootNode, \DOMNode &$node): void
    {
        $predecessors = self::getNodePredecessors($node);
        $nodeParent = $rootNode;
        foreach ($predecessors as $predecessor) {
            $nodeParent = self::getEquivalentChildNodeOrAppend($nodeParent, $predecessor);
        }

        $nodeCopy = $rootNode->ownerDocument->importNode($node, true);
        $nodeParent->appendChild($nodeCopy);
    }

    protected static function getNodePredecessors(\DOMNode $node, array &$predecessors = []): array
    {
        if (is_object($node->parentNode) && $node->parentNode->nodeType === XML_ELEMENT_NODE) {
            $predecessors[] = $node->parentNode;
            self::getNodePredecessors($node->parentNode, $predecessors);
        }

        return array_reverse($predecessors);
    }

    protected static function getEquivalentChildNodeOrAppend(\DOMNode &$nodeParent, \DOMNode &$node): \DOMNode
    {
        /** @var \DOMNode $child */
        foreach ($nodeParent->childNodes as $child) {
            if ($child->localName === $node->localName) {
                return $child;
            }
        }

        $nodeCopy = $nodeParent->ownerDocument->importNode($node);
        $nodeParent->appendChild($nodeCopy);
        return $nodeCopy;
    }

    protected static function appendNodeDescendants(\DOMNode &$rootNode, \DOMNode &$node): void
    {
        foreach ($node->childNodes as $child) {
            $nodeCopy = $rootNode->ownerDocument->importNode($child, true);
            $rootNode->appendChild($nodeCopy);
        }
    }

    protected static function saveXmlOfNodeDescendants(\DOMNode &$node): string
    {
        /** @var \DOMNode $child */
        $result = '';
        foreach ($node->childNodes as $child) {
            $result .= $child->ownerDocument->saveXML($child) . "\n";
        }
        return $result;
    }

    protected static function printXmlErrors(array $errors): string
    {
        return implode(' ', array_map(['self', 'printXmlError'], $errors));
    }

    protected static function printXmlError(\LibXMLError $error): string
    {
        return sprintf('XML Error #%s: %s.', $error->code, trim($error->message));
    }

    protected static function printError(string $message): string
    {
        return sprintf('XML Error: %s', $message);
    }
}
