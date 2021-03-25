<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Acceptance\Introduction;

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Screenshots\Tests\Acceptance\Support\BackendTester;

/**
 * Tests the screenshots backend module can be loaded
 */
class DummyCest
{
    /**
     * @param BackendTester $I
     */
    public function _before(BackendTester $I)
    {
        $I->useExistingSession('admin');
    }

    /**
     * @param BackendTester $I
     */
    public function screenshotOfTypo3Backend(BackendTester $I)
    {
        $I->setScreenshotsBasePath('/var/www/html/public/t3docs-generated/actual/TYPO3CMS-Reference-TCA');

        $I->makeScreenshotOfWindow('Documentation/Images/typo3_backend_w_introduction');
    }
}
