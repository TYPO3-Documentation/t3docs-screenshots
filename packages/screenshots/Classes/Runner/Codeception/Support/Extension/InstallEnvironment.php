<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Runner\Codeception\Support\Extension;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Codeception\Event\TestEvent;
use TYPO3\CMS\Core\Core\ApplicationContext;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\TestingFramework\Core\Acceptance\Extension\InstallMysqlCoreEnvironment;
use TYPO3\TestingFramework\Core\Testbase;

/**
 * Set up environment for TYPO3 installation process.
 *
 * This extension extends the class InstallMysqlCoreEnvironment of the typo3/testing-framework package slightly.
 * It should be integrated in the typo3/testing-framework ideally. Currently it differs by:
 *
 * - the Testbase::setUpBasicTypo3Bootstrap() method is called to initialize the paths in the static Environment
 *   instance: Helpers are partially dependent on these paths.
 *   This method is currently only used in the BackendEnvironment extension of the typo3/testing-framework package, but
 *   can probably be called here as well without side effect.
 *
 * @see \TYPO3\TestingFramework\Core\Acceptance\Extension\BackendEnvironment
 */
class InstallEnvironment extends InstallMysqlCoreEnvironment
{
    protected array $localConfig = [
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
    ];

    /**
     * Initialize TYPO3 instance
     *
     * @param TestEvent $event
     */
    public function bootstrapTypo3Environment(TestEvent $event): void
    {
        parent::bootstrapTypo3Environment($event);

        $instancePath = getenv('TYPO3_PATH_ROOT');

        $testbase = new Testbase();
        $testbase->setUpPackageStates($instancePath, [], $this->localConfig['coreExtensionsToLoad'], [], []);
        $testbase->setUpBasicTypo3Bootstrap($instancePath);

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
    }
}
