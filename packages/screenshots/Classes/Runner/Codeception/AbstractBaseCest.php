<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Runner\Codeception;

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
use TYPO3\Documentation\Screenshots\Configuration\ConfigurationException;
use TYPO3\Documentation\Screenshots\Configuration\ConfigurationRepository;
use TYPO3\Documentation\Screenshots\Configuration\ExtensionConfiguration;
use TYPO3\Documentation\Screenshots\Runner\Codeception\Support\Photographer;
use TYPO3\Documentation\Screenshots\Util\FileHelper;
use TYPO3\Documentation\Screenshots\Util\JsonHelper;

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

    public function __construct() {
        $this->consoleOutput = new ConsoleOutput();
        $this->reflectors = [];
    }

    /**
     * @param Photographer $I
     * @param string $suiteId
     */
    protected function runSuite(Photographer $I, string $suiteId): void
    {
        $pathFilter = $I->fetchScreenshotsPathFilter();
        $actionsIdFilter = $I->fetchScreenshotsActionsIdFilter();

        $originalPath = $this->getExtensionConfiguration()->getAbsoluteOriginalPath();
        $actualPath = $this->getExtensionConfiguration()->getAbsoluteActualPath();
        $configurationRepository = $this->getConfigurationRepository($originalPath);
        $configurations = $configurationRepository->findByPath($pathFilter);

        foreach ($configurations as &$configuration) {
            $originalDirectory = $configuration->getPath();
            $actualDirectory = FileHelper::getPathBySegments($actualPath, basename($originalDirectory));
            $I->setScreenshotsBasePath($actualDirectory);

            $configuration->read();
            $config = $configuration->getConfigPrepared();

            if (!empty($config['suites'][$suiteId]['screenshots'])) {
                foreach ($config['suites'][$suiteId]['screenshots'] as $actionsId => &$actions) {
                    $isMatchingActionsIdFilter = empty($actionsIdFilter) || $actionsId === $actionsIdFilter;
                    if ($isMatchingActionsIdFilter) {
                        foreach ($actions as $action) {
                            $this->handleAction($I, $action);
                        }
                    }
                }
            }
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
                'Parameter "action" or "comment" is missing in configuration "%s".',
                JsonHelper::printInlineJson($action)
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

    protected function getConfigurationRepository(string $basePath): ConfigurationRepository
    {
        return GeneralUtility::makeInstance(ConfigurationRepository::class, $basePath);
    }
}
