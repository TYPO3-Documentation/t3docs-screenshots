<?php

declare(strict_types=1);
namespace TYPO3\Documentation\ScreenshotsSuites;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Composer\Composer;
use Composer\DependencyResolver\Operation\InstallOperation;
use Composer\EventDispatcher\EventSubscriberInterface;
use Composer\Installer\PackageEvent;
use Composer\Installer\PackageEvents;
use Composer\IO\IOInterface;
use Composer\Plugin\PluginInterface;

class ComposerPlugin implements PluginInterface, EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            PackageEvents::PRE_PACKAGE_INSTALL => ['listen'],
        ];
    }

    public function activate(Composer $composer, IOInterface $io): void
    {
        $composer->getEventDispatcher()->addSubscriber($this);
    }

    public function deactivate(Composer $composer, IOInterface $io): void
    {
        // Nothing to do
    }

    public function uninstall(Composer $composer, IOInterface $io): void
    {
        // Nothing to do
    }

    /**
     * All packages of suite TYPO3 instances are normally symlinked from the main packages. TYPO3 internal paths cannot
     * be reliably resolved when a composer script is symlinked and executed, so all packages containing such composer
     * scripts should not be symlinked. This problem must be solved on composer side in the long run.
     *
     * @see https://github.com/composer/composer/issues/10119
     */
    public function listen(PackageEvent $event): void
    {
        $operation = $event->getOperation();
        if ($operation instanceof InstallOperation) {
            $package = $operation->getPackage();
            if ($package->getBinaries()) {
                $package->setTransportOptions(['symlink' => false]);
            }
        }
    }
}
