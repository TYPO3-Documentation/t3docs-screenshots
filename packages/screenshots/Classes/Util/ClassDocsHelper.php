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

use phpDocumentor\Reflection\DocBlockFactory;

class ClassDocsHelper
{
    /**
     * @var \ReflectionClass[]
     */
    protected static array $reflectors;
    /**
     * @var DocBlockFactory
     */
    private static $docBlockFactory;

    /**
     * ClassDocsHelper constructor.
     */
    public function __construct()
    {
        if (self::$docBlockFactory === null) {
            self::$docBlockFactory = DocBlockFactory::createInstance();
            self::$docBlockFactory->registerTagHandler('author', Null_::class);
            self::$docBlockFactory->registerTagHandler('covers', Null_::class);
            self::$docBlockFactory->registerTagHandler('deprecated', Null_::class);
            self::$docBlockFactory->registerTagHandler('link', Null_::class);
            self::$docBlockFactory->registerTagHandler('method', Null_::class);
            self::$docBlockFactory->registerTagHandler('property-read', Null_::class);
            self::$docBlockFactory->registerTagHandler('property', Null_::class);
            self::$docBlockFactory->registerTagHandler('property-write', Null_::class);
            self::$docBlockFactory->registerTagHandler('return', Null_::class);
            self::$docBlockFactory->registerTagHandler('see', Null_::class);
            self::$docBlockFactory->registerTagHandler('since', Null_::class);
            self::$docBlockFactory->registerTagHandler('source', Null_::class);
            self::$docBlockFactory->registerTagHandler('throw', Null_::class);
            self::$docBlockFactory->registerTagHandler('throws', Null_::class);
            self::$docBlockFactory->registerTagHandler('uses', Null_::class);
            self::$docBlockFactory->registerTagHandler('var', Null_::class);
            self::$docBlockFactory->registerTagHandler('version', Null_::class);
        }
    }


    /**
     * Extract constants, properties and methods from class, e.g.
     *
     * Input:
     * namespace Vendor\Extension\MyNamespace;
     *
     * use MyOtherNamespace\MyFirstClass;
     * use MyOtherNamespace\MySecondClass;
     *
     * class MyClass
     * {
     *      protected const MY_CONSTANT = 'MY_CONSTANT';
     *
     *      public string $myVariable = 'myValue';
     *
     *      public function myMethod(): string
     *      {
     *          return 'I am the method code';
     *      }
     *
     *      public function createMyFirstObject(array $options, int limit = 0): MyFirstClass
     *      {
     *          return new MyFirstClass();
     *      }
     *
     *      public function createMySecondObject(): MySecondClass
     *      {
     *          return new MySecondClass();
     *      }
     * }
     * Members: ["myVariable", "createMyFirstObject"]
     * Output:
     *
     *
     * .. php:namespace:: Vendor\Extension\MyNamespace\
     *
     * .. php:class:: MyClass
     *
     *    .. php:const:: MY_CONSTANT
     *
     *         MY_CONSTANT
     *
     *    .. php:attr:: myVariable
     *
     *            *  Value of some attribute
     *
     *    .. php:method:: createMyFirstObject(string $column, string $columnName = '')
     *
     *         Add a new column or override an existing one. Latter is only possible,
     *         in case $columnName is given. Otherwise, the column will be added with
     *         a numeric index, which is generally not recommended.
     *
     *         :param array $options: the options
     *         :param int $limit: Optional: the limit
     *         :returntype: MyFirstClass
     *         :returns: Some cool object
     *
     * @param string $class Class name, e.g. "TYPO3\CMS\Core\Cache\Backend\FileBackend"
     * @param array $members Constants, properties and methods to extract from class, e.g. ["freeze", "frozen"]
     * @param bool $withCode Include code
     * @param array $allowedModifiers Members with these modifiers are allowed
     *                              e.g. ["public", "protected"]
     * @param bool $allowInternal Include Internal methods?
     * @param bool $allowDeprecated Include Deprecated methods?
     * @return string
     */

    public static function extractDocsFromClass(string $class, array $members, bool $withCode,
        array $allowedModifiers, bool $allowInternal, bool $allowDeprecated,
        bool $includeConstructor): string
    {
        $classReflection = self::getClassReflection($class);
        $modifierSum = 0;

        foreach ($allowedModifiers as $modifier) {
            if ($modifier === 'public') {
                $modifierSum |= \ReflectionMethod::IS_PUBLIC;
            } else if ($modifier === 'protected') {
                $modifierSum |= \ReflectionMethod::IS_PROTECTED;
            } else if ($modifier === 'private') {
                $modifierSum |= \ReflectionMethod::IS_PRIVATE;
            } else if ($modifier === 'abstract') {
                $modifierSum |= \ReflectionMethod::IS_ABSTRACT;
            } else if ($modifier === 'final') {
                $modifierSum |= \ReflectionMethod::IS_FINAL;
            } else if ($modifier === 'static') {
                $modifierSum |= \ReflectionMethod::IS_STATIC;
            }

        }

        $result = [];
        if ($members) {
            foreach ($members as $member) {
                if ($classReflection->hasMethod($member)) {
                    $result['methods'][] = self::getMethodCode($class, $member,
                        $withCode, $modifierSum, $allowInternal, $allowDeprecated);
                } elseif ($classReflection->hasProperty($member)) {
                    $result['properties'][] = self::getPropertyCode($class,
                        $member, $withCode, $modifierSum);
                } elseif ($classReflection->hasConstant($member)) {
                    $result['constants'][] = self::getConstantCode($class,
                        $member, $withCode, $modifierSum);
                } else {
                    throw new \ReflectionException(sprintf(
                            'Cannot extract constant nor property nor method "%s" from class "%s"',
                            $member, $class)
                    );
                }
            }
        } else {
            foreach ($classReflection->getMethods() as $method) {
                $result['methods'][] = self::getMethodCode($class, $method->getShortName(),
                    $withCode, $modifierSum, $allowInternal, $allowDeprecated,
                    $includeConstructor);
            }
            foreach ($classReflection->getProperties() as $property) {
                $result['properties'][] = self::getPropertyCode($class, $property->getName(),
                    $withCode, $modifierSum);
            }
            foreach ($classReflection->getConstants() as $constant) {
                $result['constants'][] = self::getConstantCode($class, $constant, $withCode, $modifierSum);
            }
        }

        $classBody = isset($result['constants']) ? implode("", array_filter($result['constants'])) . "\n" : '';
        $classBody .= isset($result['properties']) ? implode("\n", array_filter($result['properties'])) . "\n" : '';
        $classBody .= isset($result['methods']) ? implode("\n", array_filter($result['methods'])) . "\n" : '';
        $classBody = rtrim($classBody);
        $classBody = StringHelper::indentMultilineText($classBody, '   ') . "\n";

        $classSignature = self::getClassSignature($class, $withCode);

        return $classSignature . $classBody;
    }

    protected static function getClassReflection(string $class): \ReflectionClass
    {
        if (!isset(self::$reflectors[$class])) {
            $reflector = new \ReflectionClass($class);
            self::$reflectors[$class] = $reflector;
        }

        return self::$reflectors[$class];
    }

    protected static function getUseStatementsRequiredByClassBody(string $class, string $classBody): string
    {
        $useStatements = explode("\n", trim(self::getUseStatements($class)));
        $useStatementsRequired = [];

        foreach ($useStatements as $useStatement) {
            $alias = self::getAliasFromUseStatement($useStatement);
            if ($alias !== '' && preg_match(sprintf('#\W%s\W#', $alias), $classBody) === 1) {
                $useStatementsRequired[] = $useStatement . "\n";
            }
        }

        return implode("", $useStatementsRequired);
    }

    public static function getUseStatements(string $class): string
    {
        $classReflection = self::getClassReflection($class);
        $splFileObject = new \SplFileObject($classReflection->getFileName());

        $startLineBody = $classReflection->getStartLine();

        $result = [];
        for ($lineNumber=0; $lineNumber <= $startLineBody; $lineNumber++) {
            $splFileObject->seek($lineNumber);
            $line = $splFileObject->current();
            if (preg_match('#^use [^;]*;#', $line) === 1) {
                $result[] = $line;
            }
        }

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return implode("", $result);
    }

    public static function getAliasFromUseStatement(string $useStatement): string
    {
        $alias = '';
        if (preg_match('#use ([\\\\\w]+);#', $useStatement, $matches) === 1) {
            $segments = explode('\\', $matches[1]);
            $alias = array_pop($segments);
        } elseif (preg_match('#use [\\\\\w]+ as (\w+);#', $useStatement, $matches) === 1) {
            $alias = $matches[1];
        }

        return $alias;
    }

    /**
     * Extract signature of class, e.g.
     *
     * Input:
     * class MyClass
     * {
     *      public function myMethod(): string
     *      {
     *          return 'I am the method code';
     *      }
     * }
     * Output:
     * class MyClass
     * {
     * %s
     * }
     *
     * @param string $class Class name, e.g. "TYPO3\CMS\Core\Cache\Backend\FileBackend"
     * @param bool $withCode Include code
     * @return string
     */
    public static function getClassSignature(string $class, bool $withCode = false): string
    {
        $classReflection = self::getClassReflection($class);

        $docBlockFactory = self::getDocBlockFactory();
        $splFileObject = new \SplFileObject($classReflection->getFileName());

        $namespace = $classReflection->getNamespaceName();
        $classShortName = $classReflection->getShortName();

        $result = [];
        $result[] = sprintf('.. php:namespace::  %s', $namespace);
        $result[] = "\n\n";
        $result[] = sprintf('.. php:class:: %s', $classShortName);
        $result[] = "\n\n";

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return implode("", $result);
    }

    /**
     * The first line of the doc comment returned by PHP Reflection API method getDocComment() is missing the
     * indentation. Adjust it to the indentation of the second line.
     *
     * @param string $docComment
     * @return string
     */
    public static function fixDocCommentIndentation(string $docComment): string
    {
        preg_match("/^(\s+)?.*\n(\s+)/", $docComment, $matches);
        $indentation = str_repeat(' ', strlen($matches[2]) - strlen($matches[1]) - 1);
        return $indentation . $docComment;
    }

    /**
     * Extract method from class, e.g.
     *
     * Input:
     * class MyClass
     * {
     *      public function myMethod(): string
     *      {
     *          return 'I am the method code';
     *      }
     * }
     * Method: myMethod
     * Output:
     *      public function myMethod(): string
     *      {
     *          return 'I am the method code';
     *      }
     *
     * @param string $class Class name, e.g. "TYPO3\CMS\Core\Cache\Backend\FileBackend"
     * @param string $method Method name, e.g. "freeze"
     * @param bool $withCode Include the complete method as code example?
     * @param int $modifierSum sum of all modifiers (i.e. \ReflectionMethod::IS_PUBLIC + \ReflectionMethod::IS_PROTECTED)
     * @param bool $allowInternal Include Internal methods?
     * @param bool $allowDeprecated Include Deprecated methods?
     * @return string
     */
    public static function getMethodCode(string $class, string $method,
        bool $withCode,
        int $modifierSum, bool $allowInternal, bool $allowDeprecated,
        bool $includeConstructor): string
    {
        $methodReflection = self::getMethodReflection($class, $method);
        if (
            (!$allowInternal && $methodReflection->isInternal())
            or (!$allowDeprecated && $methodReflection->isDeprecated())
            or (($modifierSum & $methodReflection->getModifiers()) == 0)
            or (!$includeConstructor && $method=='__construct')
        ) {
            return '';
        }
        $docBlockFactory = self::getDocBlockFactory();
        $splFileObject = new \SplFileObject($methodReflection->getFileName());

        $startLineBody = $methodReflection->getStartLine();
        $endLineBody = $methodReflection->getEndLine();

        $startLineSignature = max($startLineBody - 20, 0);
        for ($lineNumber=$startLineSignature; $lineNumber <= $startLineBody; $lineNumber++) {
            $splFileObject->seek($lineNumber);
            if (strpos($splFileObject->current(), sprintf('function %s', $method)) !== false) {
                $startLineSignature = $lineNumber;
            }
        }
        $methodName = $methodReflection->getName();
        $returnType = $methodReflection->getReturnType();
        $parameters = $methodReflection->getParameters();
        $parameterInSignature = [];
        $parameterInRst = [];
        foreach ($parameters as $parameter) {
            $paramName = $parameter->getName();
            $type = 'unknown';
            if ($parameter->getType()) {
                $type = $parameter->getType()->getName();
            }
            $optional = $parameter->isOptional();
            if ($optional) {
                $default = var_export($parameter->getDefaultValue(), true);
                $parameterInSignature[] = sprintf('%s %s = %s', $type, $paramName, $default);
                $parameterInRst[] = sprintf(':param %s $%s: the %s, default: %s', $type, $paramName, $paramName, $default);
            } else {
                $parameterInSignature[] = sprintf('%s %s', $type, $paramName);
                $parameterInRst[] = sprintf(':param %s $%s: the %s', $type, $paramName, $paramName);
            }
        }
        $docComment = $methodReflection->getDocComment();
        $comment = '';
        $returnComment = '';
        if ($docComment) {
            $docBlock = $docBlockFactory->create($docComment);
            $comment = $docBlock->getSummary();
            if ($docBlock->getDescription()->render()) {
                $comment .= "\n\n" . $docBlock->getDescription()->render();
            }
            $returnCommentTagArray = $docBlock->getTagsByName('return');
            $returnComment = '';
            if (is_array($returnCommentTagArray) && isset($returnCommentTagArray[0])) {
                $returnCommentExplode = explode(" ",
                    $returnCommentTagArray[0]->render(), 3);
                if (sizeof($returnCommentExplode) == 3) {
                    $returnComment = str_replace("\n", ' ',
                        $returnCommentExplode[2]);
                }
            }
        }
        $codeResult = [];
        if ($withCode) {
            for ($lineNumber=$startLineSignature; $lineNumber < $endLineBody; $lineNumber++) {
                $splFileObject->seek($lineNumber);
                $codeResult[] = $splFileObject->current();
            }
        }
        $code = implode("", $codeResult);

        $methodHead = sprintf('.. php:method:: %s(%s)', $methodName, implode(', ', $parameterInSignature)) . "\n\n";

        $result = [];
        if ($comment) {
            $result[] = $comment;
            $result[] = "\n\n";
        }
        if ($code) {
            $result[] = '.. code-block:: php';
            $result[] = "\n\n";
            $result[] = StringHelper::indentMultilineText($code, '   ');
            $result[] = "\n\n";
        }
        if ($parameterInRst) {
            $result[] = implode("\n", $parameterInRst) . "\n";
        }
        if ($returnType && $returnType->getName() != 'void') {
            $returnPart = sprintf(':returntype: %s', $returnType->getName());
            if ($returnComment) {
                $returnPart .= "\n" . sprintf(':returns: %s', $returnComment);
            }
            $result[] = $returnPart . "\n";
        }

        $methodBody = StringHelper::indentMultilineText(implode("", $result), '   ');

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return $methodHead.$methodBody;
    }

    protected static function getMethodReflection(string $class, string $method): \ReflectionMethod
    {
        if (!isset(self::$reflectors[$class])) {
            $reflector = new \ReflectionClass($class);
            self::$reflectors[$class] = $reflector;
        }

        return (self::$reflectors[$class])->getMethod($method);
    }

    protected static function getDocBlockFactory(): DocBlockFactory
    {
        if (!isset(self::$docBlockFactory)) {
            self::$docBlockFactory = DocBlockFactory::createInstance();
        }

        return self::$docBlockFactory;
    }

    /**
     * Extract member variable from class, e.g.
     *
     * Input:
     * class MyClass
     * {
     *      public string $myVariable = 'myValue';
     * }
     * Property: myVariable
     * Output:
     *      public string $myVariable = 'myValue';
     *
     * @param string $class Class name, e.g. "TYPO3\CMS\Core\Cache\Backend\FileBackend"
     * @param string $property Property name, e.g. "frozen"
     * @param bool $withCode Include the complete property code?
     * @param int $modifierSum sum of all modifiers (i.e. \ReflectionMethod::IS_PUBLIC + \ReflectionMethod::IS_PROTECTED)
     * @param bool $allowInternal Include Internal methods?
     * @param bool $allowDeprecated Include Deprecated methods?
     * @return string
     */
    public static function getPropertyCode(string $class, string $property, bool $withCode,
        int $modifierSum): string
    {
        $classReflection = self::getClassReflection($class);
        $propertyReflection = $classReflection->getProperty($property);
        $splFileObject = new \SplFileObject($classReflection->getFileName());

        if (
            ($propertyReflection->isProtected() && (($modifierSum & \ReflectionMethod::IS_PROTECTED) == 0))
            or ($propertyReflection->isPrivate() && (($modifierSum & \ReflectionMethod::IS_PRIVATE) == 0))
        ) {
            return '';
        }

        $docBlockFactory = self::getDocBlockFactory();
        $docComment = $propertyReflection->getDocComment();
        $comment = '';
        if ($docComment) {
            $docBlock = $docBlockFactory->create($docComment);
            $comment = $docBlock->getSummary();
            if ($docBlock->getDescription()->render()) {
                $comment .= "\n\n" . $docBlock->getDescription()->render();
            }
        }

        $header = sprintf('.. php:attr:: %s', $property)."\n\n";
        $body = [];
        $code = [];
        if ($comment) {
            $body[] = $comment . "\n\n";
        }
        while (!$splFileObject->eof()) {
            $line = $splFileObject->fgets();
            if (preg_match(sprintf('#(private|protected|public)[^$]*\$%s(\s*=\s*[^;]*)?;#', $property), $line) === 1) {
                $code[] = $line;
                break;
            }
        }
        if ($code) {
            $code = implode("", $code);
            if ($withCode) {
                $body[] = '.. code-block:: php' . "\n\n";
                $body[] = StringHelper::indentMultilineText($code, '   ');
            }
        }

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return $header . StringHelper::indentMultilineText(implode("", $body), '   ');
    }

    /**
     * Extract constant from class, e.g.
     *
     * Input:
     * class MyClass
     * {
     *      protected const MY_CONSTANT = 'MY_CONSTANT';
     * }
     * Constant: MY_CONSTANT
     * Output:
     *      protected const MY_CONSTANT = 'MY_CONSTANT';
     *
     * @param string $class Class name, e.g. "TYPO3\CMS\Core\Cache\Backend\FileBackend"
     * @param string $constant Constant name, e.g. "SEPARATOR"
     * @param bool $withCode Include the complete method as code example?
     * @param int $modifierSum sum of all modifiers (i.e. \ReflectionMethod::IS_PUBLIC + \ReflectionMethod::IS_PROTECTED)
     * @return string
     */
    public static function getConstantCode(string $class, string $constant,
        bool $withCode, int $modifierSum): string
    {
        $classReflection = self::getClassReflection($class);
        $constantReflection = $classReflection->getConstant($constant);

        $splFileObject = new \SplFileObject($classReflection->getFileName());

        $header = sprintf('.. php:const:: %s', $constant)."\n\n";
        $body = [];
        $body[] = sprintf(':php:`%s`, type %s',var_export($constantReflection, true), gettype($constantReflection)) . "\n\n";
            $code = [];

            while (!$splFileObject->eof()) {
                $line = $splFileObject->fgets();
                if (preg_match(sprintf('#const[\s]*%s\s*=\s*[^;]*;#',
                        $constant), $line) === 1) {
                    $code[] = $line;
                    break;
                }
            }
            if ($code) {
                $code = implode("", $code);
                if (
                    (str_contains($code, 'protected') && (($modifierSum & \ReflectionMethod::IS_PROTECTED) == 0))
                    or (str_contains($code, 'private') && (($modifierSum & \ReflectionMethod::IS_PRIVATE) == 0))
                ) {
                    return '';
                }
                if ($withCode) {
                    $body[] = '.. code-block:: php' . "\n";
                    $body[] = StringHelper::indentMultilineText($code, '   ');
                }
            }

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return $header . StringHelper::indentMultilineText(implode("", $body), '   ');
    }
}
