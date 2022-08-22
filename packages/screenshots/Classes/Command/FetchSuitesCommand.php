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
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\Documentation\Screenshots\Configuration\ConfigurationRepository;
use TYPO3\Documentation\Screenshots\Configuration\ExtensionConfiguration;
use TYPO3\Documentation\Screenshots\Util\JsonHelper;

/**
 * Command for fetching executable suites by filter
 */
class FetchSuitesCommand extends Command
{
    /**
     * Defines the allowed options for this command
     */
    protected function configure(): void
    {
        $this
            ->setDescription('Fetch executable TYPO3 environment suites.')
            ->addOption(
                'target-path',
                't',
                InputOption::VALUE_OPTIONAL,
                'Filter for suites of specific folder (relative or absolute path). ' .
                'All folders if empty.'
            )
            ->addOption(
                'suite-id',
                's',
                InputOption::VALUE_OPTIONAL,
                'Filter for specific suite ID (Core, Examples, ExtensionBuilder, Install, Introduction, SitePackage, Styleguide, Workspaces). ' .
                'All suite IDs if empty.'
            )
            ->addOption(
                'actions-id',
                'a',
                InputOption::VALUE_OPTIONAL,
                'Filter for suites with specific actions ID only. ' .
                'Suites of all actions IDs if empty.'
            );
    }

    /**
     * Fetch the suites.
     *
     * @inheritdoc
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        try {
            $pathFilter = (string)$input->getOption('target-path');
            $suiteIdFilter = (string)$input->getOption('suite-id');
            $actionsIdFilter = (string)$input->getOption('actions-id');

            $originalPath = $this->getExtensionConfiguration()->getAbsoluteOriginalPath();
            $configurationRepository = $this->getConfigurationRepository($originalPath);
            if (!empty($pathFilter)) {
                $configurations = $configurationRepository->findByPath($pathFilter);
            } else {
                $configurations = $configurationRepository->findAll();
            }

            $suites = [];
            foreach ($configurations as &$configuration) {
                $configuration->read();
                $config = $configuration->getConfigPrepared();

                if (!empty($config['suites'])) {
                    foreach ($config['suites'] as $suiteId => &$suite) {
                        $isMatchingSuiteIdFilter = empty($suiteIdFilter) || $suiteId === $suiteIdFilter;
                        $isMatchingActionsIdFilter = empty($actionsIdFilter) || isset($suite['screenshots'][$actionsIdFilter]);
                        if ($isMatchingSuiteIdFilter && $isMatchingActionsIdFilter) {
                            $suites[] = [
                                'path' => $configuration->getPath(),
                                'suiteId' => $suiteId
                            ];
                        }
                    }
                }
            }
            $io->text(JsonHelper::printPrettyJson($suites));
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

    protected function getConfigurationRepository(string $basePath): ConfigurationRepository
    {
        return GeneralUtility::makeInstance(ConfigurationRepository::class, $basePath);
    }
}
