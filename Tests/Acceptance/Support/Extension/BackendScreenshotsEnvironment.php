<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Acceptance\Support\Extension;

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

use TYPO3\TestingFramework\Core\Acceptance\Extension\BackendEnvironment;

/**
 * Load various core extensions and screenshots and call screenshots generator
 */
class BackendScreenshotsEnvironment extends BackendEnvironment
{
    /**
     * Load a list of core extensions and Screenshots
     *
     * @var array
     */
    protected $localConfig = [
        'coreExtensionsToLoad' => [
            'core',
            'extbase',
            'fluid',
            'backend',
            'about',
            'install',
            'frontend',
            'recordlist',
        ],
        'testExtensionsToLoad' => [
            'typo3conf/ext/screenshots'
        ],
        'xmlDatabaseFixtures' => [
            'PACKAGE:typo3/testing-framework/Resources/Core/Acceptance/Fixtures/be_users.xml',
            'typo3/sysext/core/Tests/Acceptance/Fixtures/be_sessions.xml',
            'PACKAGE:typo3/testing-framework/Resources/Core/Acceptance/Fixtures/be_groups.xml',
        ],
    ];
}
