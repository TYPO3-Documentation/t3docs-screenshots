<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Runner\Codeception\Support\Extension;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\TestingFramework\Core\Acceptance\Extension\InstallMysqlCoreEnvironment;

/**
 * Set up environment for TYPO3 installation process.
 */
class InstallEnvironment extends InstallMysqlCoreEnvironment
{
}
