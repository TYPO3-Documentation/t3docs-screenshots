<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Command;

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
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\Documentation\Screenshots\Configuration\ExtensionConfiguration;
use TYPO3\Documentation\Screenshots\Util\FileHelper;

/**
 * Command for cleaning up the screenshots of the former run.
 */
class CleanUpCommand extends Command
{
    /**
     * Defines the allowed options for this command
     */
    protected function configure(): void
    {
        $this->setDescription('Clean up the screenshots of the former run.');
    }

    /**
     * Clean up the screenshots.
     *
     * @inheritdoc
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        try {
            FileHelper::deleteRecursively($this->getExtensionConfiguration()->getAbsoluteActualPath());
            FileHelper::deleteRecursively($this->getExtensionConfiguration()->getAbsoluteDiffPath());
            $io->info('The screenshots of the previous run have been deleted.');
            return 0;
        } catch (\Exception $e) {
            $io->error(sprintf('%s: %s', $e->getCode(), $e->getMessage()));
            return 1;
        }
    }

    protected function getExtensionConfiguration(): ExtensionConfiguration
    {
        return GeneralUtility::makeInstance(ExtensionConfiguration::class);
    }
}
