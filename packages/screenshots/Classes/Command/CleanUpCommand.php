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
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use TYPO3\CMS\Screenshots\Util\FileHelper;

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
        $this->setDescription('Clean up the screenshots of the former run at public/t3docs-generated.');
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
            FileHelper::deleteRecursively('/var/www/html/public/t3docs-generated/actual');
            FileHelper::deleteRecursively('/var/www/html/public/t3docs-generated/diff');
            $io->success('The screenshots of the former run have been deleted successfully.');
            return 0;
        } catch (\Exception $e) {
            $io->error(sprintf('%s: %s', $e->getCode(), $e->getMessage()));
            return 1;
        }
    }
}
