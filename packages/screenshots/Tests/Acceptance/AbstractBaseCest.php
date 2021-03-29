<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Acceptance;

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

use TYPO3\CMS\Screenshots\Tests\Acceptance\Support\BackendTester;

/**
 * Tests the screenshots backend module can be loaded
 */
abstract class AbstractBaseCest
{
    /**
     * @param BackendTester $I
     * @param string $suite
     */
    protected function makeScreenshotsOfSuite(BackendTester $I, string $suite): void
    {
        $originalPath = '/var/www/html/public/t3docs';
        $actualPath = '/var/www/html/public/t3docs-generated/actual';

        $directories = array_filter(glob($originalPath . '/*'), 'is_dir');
        foreach ($directories as $originalDirectory) {
            $configPath = $originalDirectory . '/screenshots.json';

            if (is_file($configPath)) {
                $actualDirectory = $actualPath . DIRECTORY_SEPARATOR . basename($originalDirectory);
                $I->setScreenshotsBasePath($actualDirectory);
                $I->cleanupScreenshotsBasePath();

                $configuration = $I->loadScreenshotsConfiguration($configPath);
                $config = $configuration->getConfig();

                if (!empty($config['suites'][$suite]['screenshots'])) {
                    foreach ($config['suites'][$suite]['screenshots'] as $actions) {
                        foreach ($actions as $action) {
                            $name = array_shift($action);
                            $params = $action;
                            call_user_func_array([$I, $name], $params);
                        }
                    }
                }
            }
        }
    }
}
