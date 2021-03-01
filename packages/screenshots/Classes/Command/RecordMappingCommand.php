<?php

namespace T3\Screenshots\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use TYPO3\CMS\Core\Core\Environment;
use TYPO3\CMS\Core\Database\ConnectionPool;
use TYPO3\CMS\Core\Utility\GeneralUtility;

class RecordMappingCommand extends Command
{
    protected SymfonyStyle $io;

    protected function initCommand(InputInterface $input, OutputInterface $output)
    {
        $this->io = new SymfonyStyle($input, $output);
        $this->createFolderIfNotExists(Environment::getProjectPath() . '/public/Output/json/');
    }

    protected function configure()
    {
        $this->setDescription('Generates Pagetree Mapping as JSON-file');

        $this->addOption('filename', null, InputArgument::OPTIONAL, 'filename relative to public/Output/json/',
            'file.json');
        $this->addOption('table', null, InputArgument::OPTIONAL, 'tablename (defaults to pages))',
            'pages');
        $this->addOption('checkDeleted', null, InputArgument::OPTIONAL, 'should the deleted field be checked?',
            'true');
        $this->addOption('additional-fields', null, InputOption::VALUE_OPTIONAL,
            'additional fields to fetch ("field1,field2,field3")',
            '');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $this->initCommand($input, $output);

        $qb = GeneralUtility::makeInstance(ConnectionPool::class)->getQueryBuilderForTable('pages');
        $qb
            ->select('uid')
            ->addSelect(...$this->getAdditionalFields($input))
            ->from($input->getOption('table'));

        if ($input->getOption('checkDeleted') === 'true') {
            $qb->where(
                $qb->expr()->eq('deleted', 0)
            );
        }
        $resultJson = json_encode($qb->execute()->fetchAllAssociative());
        $file = fopen(
            sprintf(
                '%s/%s/%s', Environment::getProjectPath(), 'public/Output/json', $input->getOption('filename')
            ), 'w'
        );
        ftruncate($file, '0');
        fwrite($file, $resultJson);
        fclose($file);
        $this->io->success(sprintf('JSON-File (%s) created.',
            Environment::getProjectPath() . '/public/Output/json/' . $input->getOption('filename')));

        return 0;
    }

    private function createFolderIfNotExists(string $folder)
    {
        if (! file_exists($folder)) {
            mkdir($folder);
        }
    }

    private function getAdditionalFields(InputInterface $input): array
    {
        $parameter = $input->getOption('additional-fields');
        if (empty($parameter)) {
            return [];
        }

        return explode(',', $parameter);
    }
}
