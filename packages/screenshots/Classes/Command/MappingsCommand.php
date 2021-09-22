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
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use TYPO3\CMS\Core\Database\ConnectionPool;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\Documentation\Screenshots\Util\JsonHelper;

/**
 * Command for listing all mappings from one field to another field of a specific database table.
 */
class MappingsCommand extends Command
{
    /**
     * Defines the allowed options for this command
     */
    protected function configure(): void
    {
        $this
            ->setDescription('List mappings of one field to another field of the same database table.')
            ->addArgument(
                'table',
                InputArgument::REQUIRED,
                'List mappings of this table.'
            )
            ->addOption(
                'from',
                '',
                InputOption::VALUE_REQUIRED,
                'This table field serves as source of the mapping.'
            )
            ->addOption(
                'to',
                '',
                InputOption::VALUE_REQUIRED,
                'This table field serves as target of the mapping.'
            );
    }

    /**
     * Render the list of all mappings
     *
     * @inheritdoc
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        try {
            $table = (string)$input->getArgument('table');
            $fromField = (string)$input->getOption('from');
            $toField = (string)$input->getOption('to');

            $connection = GeneralUtility::makeInstance(ConnectionPool::class)->getConnectionForTable($table);
            $queryBuilder = $connection->createQueryBuilder();
            $queryBuilder->getRestrictions()->removeAll();

            $query = $queryBuilder
                ->select(...[$fromField, $toField])
                ->from($table)
            ;
            $result = $query->execute();

            $mappings = [];
            while ($row = $result->fetch()) {
                if ($row[$fromField] !== null && $row[$fromField] !== '' && !isset($mappings[$row[$fromField]])) {
                    $mappings[$row[$fromField]] = $row[$toField];
                }
            }
            $io->text(JsonHelper::printPrettyJson($mappings));
            return 0;
        } catch (\Exception $e) {
            $io->error(sprintf('%s: %s', $e->getCode(), $e->getMessage()));
            return 1;
        }
    }
}
