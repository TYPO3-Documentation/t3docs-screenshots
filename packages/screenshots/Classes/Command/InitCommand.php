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
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use TYPO3\CMS\Screenshots\Runner\Configuration\Configuration;

/**
 * Command for initializing a basic screenshots.json.
 */
class InitCommand extends Command
{
    /**
     * Defines the allowed options for this command
     */
    protected function configure(): void
    {
        $configuration = new Configuration();

        $this
            ->setDescription('Initialize a basic screenshots.json at a given path.')
            ->addArgument(
                'path',
                InputArgument::OPTIONAL,
                sprintf('The relative or absolute path to the folder of the screenshots.json. ' .
                'For relative paths the base path is %s.', $configuration->getBasePath()),
                'My-Manual'
            );
    }

    /**
     * Initialize the screenshots.json.
     *
     * @inheritdoc
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        try {
            $path = (string)$input->getArgument('path');

            $configuration = new Configuration($path);
            $configuration->createBasicConfig();
            $configuration->write();

            $io->success(sprintf('The basic configuration has been created at %s.', $configuration->getFilePath()));
            return 0;
        } catch (\Exception $e) {
            $io->error(sprintf('%s: %s', $e->getCode(), $e->getMessage()));
            return 1;
        }
    }
}
