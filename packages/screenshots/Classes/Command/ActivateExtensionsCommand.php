<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Command;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\TestingFramework\Core\Testbase;

/**
 * Command for creating a custom TYPO3 package artifact which can prevent custom distributions from being activated.
 */
class ActivateExtensionsCommand extends Command
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
        ]
    ];

    /**
     * Defines the allowed options for this command
     */
    protected function configure(): void
    {
        $this
            ->setDescription('Enable TYPO3 extensions.')
            ->addOption(
                'extension',
                'e',
                InputOption::VALUE_IS_ARRAY | InputOption::VALUE_REQUIRED,
                'Enable this custom extension, specified by the relative extension path, ' .
                'next to the core extensions.'
            );
    }

    /**
     * Create the TYPO3 package artifact.
     *
     * @inheritdoc
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $extensions = $input->getOption('extension');

        try {
            $testbase = new Testbase();
            $testbase->setUpPackageStates(Environment::getPublicPath(), [], $this->localConfig['coreExtensionsToLoad'], $extensions, []);
            copy(Environment::getPublicPath() . '/typo3temp/var/build/PackageArtifact.php', Environment::getProjectPath() . '/var/build/PackageArtifact.php');
            unlink(Environment::getPublicPath() . '/typo3temp/var/build/PackageArtifact.php');
            $io->success('The TYPO3 extensions have been activated successfully.');
            return 0;
        } catch (\Exception $e) {
            $io->error(sprintf('%s: %s', $e->getCode(), $e->getMessage()));
            return 1;
        }
    }
}
