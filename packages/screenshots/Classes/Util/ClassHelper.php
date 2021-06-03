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
    public static function getClassSignature(string $class, bool $withComment = true): string
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

    protected static function getClassReflection(string $class): \ReflectionClass
    {
        if (!isset(self::$reflectors[$class])) {
            $reflector = new \ReflectionClass($class);
            self::$reflectors[$class] = $reflector;
        }

        return self::$reflectors[$class];
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
    public static function getMethodCode(string $class, string $method, bool $withComment = true): string
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
    public static function getPropertyCode(string $class, string $property, bool $withComment = true): string
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
}
