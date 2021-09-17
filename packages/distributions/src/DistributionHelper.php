<?php
declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Distributions;

use Composer\Json\JsonFile;
use Composer\Script\Event;
use TYPO3\CMS\Composer\Plugin\Config;

class DistributionHelper
{
    public static function setupComposerJsonFiles(Event $event): void
    {
        if (empty($_ENV['DDEV_DOCROOT'])) {
            throw new \RuntimeException('This script must be executed in ddev container. Please call it with "ddev composer intitialize-distributions"', 1631896871);
        }

        $config = Config::load($event->getComposer());
        $rootJsonFile = new JsonFile($config->getBaseDir() . '/composer.json');
        $rootJsonConfig = $rootJsonFile->read();
        $allDistributionHostNames = $notLocalDistributionHostNames = [];
        foreach (glob($config->getBaseDir() . '/distributions/*/dist.json') as $distFile) {
            $distJsonFile = new JsonFile($distFile);
            $targetDistJsonFile = new JsonFile(dirname($distFile) . '/composer.json');
            $targetJsonConfig = $rootJsonConfig;
            foreach ($distJsonFile->read() as $key => $value) {
                $targetJsonConfig[$key] = $value;
            }
            $targetDistJsonFile->write($targetJsonConfig);
            $distHostName = basename(dirname($distFile)) . '.distribution';
            $allDistributionHostNames[] = $distHostName;
            if (strpos($distHostName, 'local-') !== 0) {
                $notLocalDistributionHostNames[] = $distHostName;
            }
        }

        $ddevConfigFile = $config->getBaseDir() . '/.ddev/config.distributions.yaml';
        $ddevConfigFileContent = sprintf("additional_hostnames:\n    - \"%s\"\n", implode("\"\n    - \"", $notLocalDistributionHostNames));
        file_put_contents($ddevConfigFile, $ddevConfigFileContent);
        @unlink($config->getBaseDir() . '/.ddev/config.zz-all-distributions.yaml');
        if ($allDistributionHostNames !== $notLocalDistributionHostNames) {
            $ddevConfigFile = $config->getBaseDir() . '/.ddev/config.zz-all-distributions.yaml';
            $ddevConfigFileContent = sprintf("additional_hostnames:\n    - \"%s\"\n", implode("\"\n    - \"", $allDistributionHostNames));
            file_put_contents($ddevConfigFile, $ddevConfigFileContent);
        }
    }
}
