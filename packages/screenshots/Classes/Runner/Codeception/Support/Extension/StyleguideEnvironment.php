<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Runner\Codeception\Support\Extension;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Codeception\Event\SuiteEvent;
use TYPO3\CMS\Core\Core\ApplicationContext;
use TYPO3\CMS\Core\Core\Bootstrap;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\CMS\Styleguide\TcaDataGenerator\Generator;
use TYPO3\TestingFramework\Core\Acceptance\Extension\BackendEnvironment;

/**
 * Load all core extensions and EXT:styleguide and EXT:screenshots
 */
class StyleguideEnvironment extends BackendEnvironment
{
    /**
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
            'typo3conf/ext/styleguide',
            'typo3conf/ext/screenshots',
        ],
        'xmlDatabaseFixtures' => [
            'EXT:screenshots/Classes/Runner/Codeception/Fixtures/StyleguideEnvironment/be_groups.xml',
            'EXT:screenshots/Classes/Runner/Codeception/Fixtures/StyleguideEnvironment/be_sessions.xml',
            'EXT:screenshots/Classes/Runner/Codeception/Fixtures/StyleguideEnvironment/be_users.xml',
        ],
    ];

    /**
     * Initialize TYPO3 instance
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

        // The database initialization uses DataHandler for some parts. DataHandler needs an initialized BE user
        // with admin right and the live workspace.
        Bootstrap::initializeBackendUser();
        $GLOBALS['BE_USER']->user['admin'] = 1;
        $GLOBALS['BE_USER']->user['uid'] = 1;
        $GLOBALS['BE_USER']->workspace = 0;
        Bootstrap::initializeLanguageObject();

        $styleguideGenerator = new Generator();
        $styleguideGenerator->create();
    }
}
