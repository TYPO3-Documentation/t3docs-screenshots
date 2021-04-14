<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Runner\Codeception\Support\Extension;

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

use Codeception\Event\SuiteEvent;
use TYPO3\CMS\Core\Core\ApplicationContext;
use TYPO3\CMS\Core\Core\Bootstrap;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Object\ObjectManager;
use TYPO3\CMS\Extensionmanager\Utility\InstallUtility;
use TYPO3\TestingFramework\Core\Acceptance\Extension\BackendEnvironment;

/**
 * Load various core extensions and introduction package and call screenshots generator
 */
class IntroductionEnvironment extends BackendEnvironment
{
    /**
     * Load all core extensions, the introduction package and EXT:screenshots
     *
     * @var array
     */
    protected $localConfig = [
        // Order matters: Align sorting of core extensions with /public/typo3conf/PackageStates.php
        'coreExtensionsToLoad' => [
            'core',
            'scheduler',
            'extbase',
            'fluid',
            'frontend',
            'fluid_styled_content',
            'filelist',
            'impexp',
            'form',
            'install',
            'info',
            'linkvalidator',
            'reports',
            'redirects',
            'recordlist',
            'backend',
            'indexed_search',
            'recycler',
            'setup',
            'rte_ckeditor',
            'adminpanel',
            'belog',
            'beuser',
            'dashboard',
            'extensionmanager',
            'felogin',
            'filemetadata',
            'lowlevel',
            'opendocs',
            'seo',
            'sys_note',
            't3editor',
            'tstemplate',
            'viewpage',
        ],
        'testExtensionsToLoad' => [
            'typo3conf/ext/introduction',
            'typo3conf/ext/bootstrap_package',
            'typo3conf/ext/screenshots',
        ],
        'xmlDatabaseFixtures' => [
            'PACKAGE:typo3/testing-framework/Resources/Core/Acceptance/Fixtures/be_users.xml',
            'PACKAGE:typo3/testing-framework/Resources/Core/Acceptance/Fixtures/be_groups.xml',
            'EXT:screenshots/Classes/Runner/Codeception/Fixtures/be_sessions.xml',
        ],
    ];

    /**
     * Generate screenshots data
     *
     * @param SuiteEvent $suiteEvent
     */
    public function bootstrapTypo3Environment(SuiteEvent $suiteEvent): void
    {
        parent::bootstrapTypo3Environment($suiteEvent);

        Environment::initialize(
            new ApplicationContext('Testing'),
            Environment::isCli(),
            Environment::isComposerMode(),
            Environment::getProjectPath(),
            Environment::getPublicPath(),
            Environment::getVarPath(),
            Environment::getConfigPath(),
            Environment::getBackendPath() . '/index.php',
            Environment::isWindows() ? 'WINDOWS' : 'UNIX'
        );

        // screenshots generator uses DataHandler for some parts. DataHandler needs an initialized BE user
        // with admin right and the live workspace.
        Bootstrap::initializeBackendUser();
        $GLOBALS['BE_USER']->user['admin'] = 1;
        $GLOBALS['BE_USER']->user['uid'] = 1;
        $GLOBALS['BE_USER']->workspace = 0;
        Bootstrap::initializeLanguageObject();

        $extensionKey = 'introduction';
        $objectManager = GeneralUtility::makeInstance(ObjectManager::class);
        $objectManager->get(InstallUtility::class)->install($extensionKey);
    }
}
