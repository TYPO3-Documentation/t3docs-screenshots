<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Util;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Screenshots\Reflection\ReflectionClass;

class ClassHelper
{
    /**
     * @var \ReflectionClass[]
     */
    protected static array $reflectors;

    /**
     * Extract constants, properties and methods from class, e.g.
     *
     * Input:
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
     *      public function createMyFirstObject(): MyFirstClass
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
     * use MyOtherNamespace\MyFirstClass;
     *
     * class MyClass
     * {
     *      public string $myVariable = 'myValue';
     *
     *      public function createMyFirstObject(): MyFirstClass
     *      {
     *          return new MyFirstClass();
     *      }
     * }
     *
     * @param string $class Class name, e.g. "TYPO3\CMS\Core\Cache\Backend\FileBackend"
     * @param array $members Constants, properties and methods to extract from class, e.g. ["freeze", "frozen"]
     * @param bool $withComment Include comments?
     * @return string
     */
    public static function extractMembersFromClass(string $class, array $members, bool $withComment = false): string
    {
        $classReflection = self::getClassReflection($class);

        $code = [];
        foreach ($members as $member) {
            if ($classReflection->hasMethod($member)) {
                $code['methods'][] = self::getMethodCode($class, $member, $withComment);
            } elseif ($classReflection->hasProperty($member)) {
                $code['properties'][] = self::getPropertyCode($class, $member, $withComment);
            } elseif ($classReflection->hasConstant($member)) {
                $code['constants'][] = self::getConstantCode($class, $member);
            } else {
                throw new \ReflectionException(sprintf(
                    'Cannot extract constant nor property nor method "%s" from class "%s"', $member, $class)
                );
            }
        }

        $classBody = isset($code['constants']) ? implode("", $code['constants']) . "\n" : '';
        $classBody .= isset($code['properties']) ? implode("\n", $code['properties']) . "\n" : '';
        $classBody .= isset($code['methods']) ? implode("\n", $code['methods']) . "\n" : '';
        $classBody = rtrim($classBody);

        $useStatements = self::getUseStatementsRequiredByClassBody($class, $classBody);
        $classSignature = self::getClassSignature($class, $withComment);

        if ($useStatements !== '') {
            $classFrame = $useStatements . "\n" . $classSignature;
        } else {
            $classFrame = $classSignature;
        }

        return sprintf($classFrame, $classBody);
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
     * @param bool $withComment Include comment?
     * @return string
     */
    public static function getClassSignature(string $class, bool $withComment = false): string
    {
        $classReflection = self::getClassReflection($class);
        $splFileObject = new \SplFileObject($classReflection->getFileName());

        $classShortName = $classReflection->getShortName();
        $startLineBody = $classReflection->getStartLine();
        $endLineBody = $classReflection->getEndLine();

        $startLineSignature = max($startLineBody - 20, 0);
        for ($lineNumber=$startLineSignature; $lineNumber <= $startLineBody; $lineNumber++) {
            $splFileObject->seek($lineNumber);
            if (strpos($splFileObject->current(), sprintf('class %s', $classShortName)) !== false) {
                $startLineSignature = $lineNumber;
            }
        }

        $result = [];
        if ($withComment && $classReflection->getDocComment() !== false) {
            $result[] = $classReflection->getDocComment() . "\n";
        }
        for ($lineNumber=$startLineSignature; $lineNumber <= $startLineBody; $lineNumber++) {
            $splFileObject->seek($lineNumber);
            $result[] = $splFileObject->current();
        }
        $result[] = '%s' . "\n";
        $splFileObject->seek($endLineBody-1);
        $result[] = $splFileObject->current();

        if (substr($result[0], 0, 1) !== ' ' && isset($result[1])) {
            preg_match('/^(\s+)/', $result[1], $matches);
            if (isset($matches[1])) {
                $result[0] = $matches[1] . $result[0];
            }
        }

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return implode("", $result);
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
     * @param bool $withComment Include comment?
     * @return string
     */
    public static function getMethodCode(string $class, string $method, bool $withComment = false): string
    {
        $methodReflection = self::getMethodReflection($class, $method);
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

        $result = [];
        if ($withComment && $methodReflection->getDocComment() !== false) {
            $result[] = $methodReflection->getDocComment() . "\n";
        }
        for ($lineNumber=$startLineSignature; $lineNumber < $endLineBody; $lineNumber++) {
            $splFileObject->seek($lineNumber);
            $result[] = $splFileObject->current();
        }

        if (substr($result[0], 0, 1) !== ' ' && isset($result[1])) {
            preg_match('/^(\s+)/', $result[1], $matches);
            if (isset($matches[1])) {
                $result[0] = $matches[1] . $result[0];
            }
        }

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return implode("", $result);
    }

    protected static function getMethodReflection(string $class, string $method): \ReflectionMethod
    {
        if (!isset(self::$reflectors[$class])) {
            $reflector = new \ReflectionClass($class);
            self::$reflectors[$class] = $reflector;
        }

        return (self::$reflectors[$class])->getMethod($method);
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
     * @param bool $withComment Include comment?
     * @return string
     */
    public static function getPropertyCode(string $class, string $property, bool $withComment = false): string
    {
        $classReflection = self::getClassReflection($class);
        $propertyReflection = $classReflection->getProperty($property);
        $splFileObject = new \SplFileObject($classReflection->getFileName());

        $result = [];
        if ($withComment && $propertyReflection->getDocComment() !== false) {
            $result[] = $propertyReflection->getDocComment() . "\n";
        }
        while (!$splFileObject->eof()) {
            $line = $splFileObject->fgets();
            if (preg_match(sprintf('#(private|protected|public)[^$]*\$%s(\s*=\s*[^;]*)?;#', $property), $line) === 1) {
                $result[] = $line;
                break;
            }
        }

        if (substr($result[0], 0, 1) !== ' ' && isset($result[1])) {
            preg_match('/^(\s+)/', $result[1], $matches);
            if (isset($matches[1])) {
                $result[0] = $matches[1] . $result[0];
            }
        }

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return implode("", $result);
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
     * @return string
     */
    public static function getConstantCode(string $class, string $constant): string
    {
        $classReflection = self::getClassReflection($class);
        $constantReflection = $classReflection->getConstant($constant);
        if ($constantReflection === false) {
            throw new \ReflectionException(sprintf('Constant %s does not exist', $constant));
        }
        $splFileObject = new \SplFileObject($classReflection->getFileName());

        $result = [];
        while (!$splFileObject->eof()) {
            $line = $splFileObject->fgets();
            if (preg_match(sprintf('#const[\s]*%s\s*=\s*[^;]*;#', $constant), $line) === 1) {
                $result[] = $line;
                break;
            }
        }

        if (substr($result[0], 0, 1) !== ' ' && isset($result[1])) {
            preg_match('/^(\s+)/', $result[1], $matches);
            if (isset($matches[1])) {
                $result[0] = $matches[1] . $result[0];
            }
        }

        // SplFileObject locks the file, so null it when no longer needed
        $splFileObject = null;
        return implode("", $result);
    }
}
