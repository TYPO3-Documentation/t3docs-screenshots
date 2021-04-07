<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Runner\Codeception;

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Screenshots\Runner\Codeception\Support\BackendTester;

/**
 * Tests the screenshots backend module can be loaded
 */
abstract class AbstractBaseCest
{
    protected $reflectors = [];

    /**
     * @param BackendTester $I
     * @param string $suite
     */
    protected function runSuite(BackendTester $I, string $suite): void
    {
        $originalPath = '/var/www/html/public/t3docs';
        $actualPath = '/var/www/html/public/t3docs-generated/actual';

        $directories = array_filter(glob($originalPath . '/*'), 'is_dir');
        foreach ($directories as $originalDirectory) {
            $configPath = $originalDirectory . '/screenshots.json';

            if (is_file($configPath)) {
                $actualDirectory = $actualPath . DIRECTORY_SEPARATOR . basename($originalDirectory);
                $I->setScreenshotsBasePath($actualDirectory);

                $configuration = $I->loadScreenshotsConfiguration($configPath);
                $config = $configuration->getConfig();

                if (!empty($config['suites'][$suite]['screenshots'])) {
                    foreach ($config['suites'][$suite]['screenshots'] as $actions) {
                        foreach ($actions as $action) {
                            $this->runAction($I, $action);
                        }
                    }
                }
            }
        }
    }

    protected function runAction(BackendTester $I, array $action)
    {
        if (isset($action['action'])) {
            $name = $action['action'];
            unset($action['action']);
            $params = $this->mapAssociativeArrayToActionParams(BackendTester::class, $name, $action);
        } else {
            $name = array_shift($action);
            $params = $action;
        }

        foreach ($params as &$param) {
            if (is_array($param)) {
                $param = $this->runAction($I, $param);
            }
        }

        return call_user_func_array([$I, $name], $params);
    }

    protected function mapAssociativeArrayToActionParams(string $class, string $action, array $associativeArray): array
    {
        $actionReflection = $this->getActionReflection($class, $action);
        $params = [];

        foreach ($actionReflection->getParameters() as $param) {
            if (isset($associativeArray[$param->getName()])) {
                $params[] = $associativeArray[$param->getName()];
            } else {
                if ($param->isDefaultValueAvailable()) {
                    $params[] = $param->getDefaultValue();
                } else {
                    throw new \ReflectionException(sprintf(
                        'Parameter "%s" is missing in action %s', $param->getName(), $action
                    ));
                }
            }
        }

        return $params;
    }

    protected function getActionReflection(string $class, string $action): \ReflectionMethod
    {
        if (!isset($this->reflectors[$class])) {
            $reflector = new \ReflectionClass($class);
            $this->reflectors[$class] = $reflector;
        }

        return $this->reflectors[$class]->getMethod($action);
    }
}
