<?php
declare(strict_types=1);
namespace TYPO3\Documentation\ScreenshotsSuites;

use Composer\Json\JsonFile;
use Composer\Package\Dumper\ArrayDumper;
use Composer\Script\Event;
use Composer\Util\Filesystem;
use TYPO3\CMS\Composer\Plugin\Config;

class SuiteHelper
{
    public static function setupComposerJsonFiles(Event $event): void
    {
        if (empty($_ENV['DDEV_DOCROOT'])) {
            throw new \RuntimeException('This script must be executed in ddev container. Please call it with "ddev composer initialize-suites"', 1631896871);
        }

        $cliArguments = $event->getArguments();
        $suitePath = $cliArguments[0] ?? 'suites/*';

        $config = Config::load($event->getComposer());
        $rootJsonFile = new JsonFile($config->getBaseDir() . '/composer.json');
        $rootJsonConfig = $rootJsonFile->read();
        foreach (glob($config->getBaseDir() . '/' . $suitePath . '/dist.json') as $distFile) {
            $distJsonFile = new JsonFile($distFile);
            $targetDistJsonFile = new JsonFile(dirname($distFile) . '/composer.json');
            $targetJsonConfig = $rootJsonConfig;
            foreach ($distJsonFile->read() as $key => $value) {
                // Composer fails if parameter requires object but array is passed
                // - remove parameter instead
                if (is_array($value) && empty($value)) {
                    unset($targetJsonConfig[$key]);
                    continue;
                }
                $targetJsonConfig[$key] = $value;
            }
            $targetJsonConfig['repositories'] = [];
            $targetJsonConfig['repositories']['packagist'] = false;
            $targetJsonConfig['repositories']['local'] = [
                'type' => 'composer',
                'url' => 'file://' . $config->getBaseDir() . '/suites/composer',
            ];

            $targetDistJsonFile->write($targetJsonConfig);
        }

        self::createComposerRepositoryFromInstalledPackages($event);
    }

    private static function createComposerRepositoryFromInstalledPackages(Event $event): void
    {
        $composer = $event->getComposer();
        $config = Config::load($composer);
        $rootPackage = $composer->getPackage();
        $autoLoadGenerator = $composer->getAutoloadGenerator();
        $localRepo = $composer->getRepositoryManager()->getLocalRepository();
        $packagesAndPath = $autoLoadGenerator->buildPackageMap($composer->getInstallationManager(), $rootPackage, $localRepo->getCanonicalPackages());

        $packages = [];
        $arrayDumper = new ArrayDumper();
        foreach ($packagesAndPath as [$package, $path]) {
            if ($package === $rootPackage) {
                continue;
            }
            $packageInfo = $arrayDumper->dump($package);
            unset($packageInfo['dist'],
                $packageInfo['source'],
                $packageInfo['installation-source'],
                $packageInfo['notification-url'],
            );

            $packageInfo['dist'] = [
                'type' => 'path',
                'url' => $composer->getInstallationManager()->getInstallPath($package),
                'reference' => $package->getInstallationSource() === 'source' ? $package->getSourceReference() : $package->getDistReference(),
            ];

            $packages[$package->getName()][$package->getPrettyVersion()] = $packageInfo;

        }

        $packageJson = [
            'packages' => $packages,
        ];

        $filesystem = new Filesystem();
        $composerRepoFolder = $config->getBaseDir() . '/suites/composer';
        $filesystem->ensureDirectoryExists($composerRepoFolder);
        file_put_contents($composerRepoFolder . '/packages.json', json_encode($packageJson, JSON_PRETTY_PRINT));
    }
}
