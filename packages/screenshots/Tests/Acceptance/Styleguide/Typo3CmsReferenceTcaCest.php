<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Tests\Acceptance\Styleguide;

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
class Typo3CmsReferenceTcaCest
{
    /**
     * @param BackendTester $I
     */
    public function _before(BackendTester $I): void
    {
        $I->useExistingSession('admin');
    }

    /**
     * @param BackendTester $I
     */
    public function screenshotOfTypo3Backend(BackendTester $I): void
    {
        $I->setScreenshotsBasePath('/var/www/html/public/t3docs-generated/actual/TYPO3CMS-Reference-TCA');

        $I->makeScreenshotOfTable(0, 'pages', 'Documentation/Images/table');
        $I->makeScreenshotOfTable(0, 'pages', 'Documentation/Images/table_element', '.recordlist');
        $I->makeScreenshotOfRecord('pages', 1, 'Documentation/Images/record');
        $I->makeScreenshotOfRecord('pages', 1, 'Documentation/Images/record_element', 'div[role="tabpanel"]');
        $I->makeScreenshotOfField('pages', 1, 'title', 'Documentation/Images/fields');
        $I->makeScreenshotOfField('pages', 1, 'title', 'Documentation/Images/fields_element', 'fieldset.form-section');
    }
}
