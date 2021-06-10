<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Runner\Codeception;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use ReflectionClass;
use ReflectionMethod;
use Symfony\Component\Console\Output\ConsoleOutput;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Screenshots\Configuration\ConfigurationException;
use TYPO3\CMS\Screenshots\Configuration\ConfigurationRepository;
use TYPO3\CMS\Screenshots\Configuration\ExtensionConfiguration;
use TYPO3\CMS\Screenshots\Runner\Codeception\Support\Photographer;
use TYPO3\CMS\Screenshots\Util\FileHelper;

/**
 * Tests the screenshots backend module can be loaded
 */
abstract class AbstractBaseCest
{
    /**
     * Symfony's console output is provided implicitly by Codeception
     *
     * @var ConsoleOutput
     */
    protected ConsoleOutput $consoleOutput;

    /**
     * @var ReflectionClass[]
     */
    protected array $reflectors;

    protected ConfigurationRepository $configurationRepository;

    public function __construct() {
        $this->configurationRepository = GeneralUtility::makeInstance(
            ConfigurationRepository::class, $this->getExtensionConfiguration()->getAbsoluteOriginalPath()
        );
        $this->consoleOutput = new ConsoleOutput();
        $this->reflectors = [];
    }

    /**
     * @param Photographer $I
     * @param string $suite
     */
    protected function runSuite(Photographer $I, string $suite): void
    {
        $actualPath = $this->getExtensionConfiguration()->getAbsoluteActualPath();
        $pathFilter = $I->fetchScreenshotsPathFilter();
        $actionsIdFilter = $I->fetchScreenshotsActionsIdFilter();

        if (!empty($pathFilter)) {
            $configurations = $this->configurationRepository->findByPath($pathFilter);
        } else {
            $configurations = $this->configurationRepository->findAll();
        }

        foreach ($configurations as $configuration) {
            $originalDirectory = $configuration->getPath();
            $actualDirectory = FileHelper::getPathBySegments($actualPath, basename($originalDirectory));

            $configuration->read();
            $config = $configuration->getConfigPrepared();
            if (!empty($config['suites'][$suite]['screenshots'])) {
                $this->prepareEnvironment($I, $suite);
                $I->setScreenshotsBasePath($actualDirectory);
                foreach ($config['suites'][$suite]['screenshots'] as $actionsId => $actions) {
                    $isActionsEnabled = empty($actionsIdFilter) || $actionsId === $actionsIdFilter;
                    if ($isActionsEnabled) {
                        foreach ($actions as $action) {
                            $this->handleAction($I, $action);
                        }
                    }
                }
            }
        }
    }

    protected function prepareEnvironment(Photographer &$I, string $suite): void
    {
        $I->resetCodeSnippetsConfig();
        $I->resetNavigationConfig();
        $I->resetScreenshotsConfig();

        if ($suite === 'Install') {
            $I->restartBrowserAndLoadInstallationProcess();
        } else {
            $I->restartBrowserAndLoadBackend();
        }
    }

    protected function handleAction(Photographer $I, array $action)
    {
        if (isset($action['comment'])) {
            $this->printComment($action);
        } elseif (isset($action['action'])) {
            $this->runAction($I, $action);
        } else {
            throw new ConfigurationException(sprintf(
                'Parameter "action" or "comment" is missing in configuration "%s".', json_encode($action)
            ));
        }
    }

    protected function printComment(array $action)
    {
        $this->consoleOutput->writeln(' ' . $action['comment']);
    }

    protected function runAction(Photographer $I, array $action)
    {
        $name = $action['action'];
        unset($action['action']);
        $params = $this->mapAssociativeArrayToActionParams(Photographer::class, $name, $action);

        foreach ($params as &$param) {
            if (is_array($param) && isset($param['action'])) {
                $param = $this->runAction($I, $param);
            }
        }

        return call_user_func_array([$I, $name], $params);
    }

    protected function mapAssociativeArrayToActionParams(string $class, string $action, array $associativeArray): array
    {
        $actionReflection = $this->getActionReflection($class, $action);
        $params = [];

        foreach ($actionReflection->getParameters() as $param) {
            if (isset($associativeArray[$param->getName()])) {
                $params[] = $associativeArray[$param->getName()];
                unset($associativeArray[$param->getName()]);
            } else {
                if ($param->isDefaultValueAvailable()) {
                    $params[] = $param->getDefaultValue();
                } else {
                    throw new ConfigurationException(sprintf(
                        'Parameter "%s" is missing in action %s.', $param->getName(), $action
                    ));
                }
            }
        }

        if (count($associativeArray) > 0) {
            throw new ConfigurationException(sprintf(
                'Parameters "%s" are not supported by action %s.',
                implode('", "', array_keys($associativeArray)), $action
            ));
        }

        return $params;
    }

    protected function getActionReflection(string $class, string $action): ReflectionMethod
    {
        if (!isset($this->reflectors[$class])) {
            $reflector = new ReflectionClass($class);
            $this->reflectors[$class] = $reflector;
        }

        return $this->reflectors[$class]->getMethod($action);
    }

    protected function getExtensionConfiguration(): ExtensionConfiguration
    {
        return GeneralUtility::makeInstance(ExtensionConfiguration::class);
    }
}
