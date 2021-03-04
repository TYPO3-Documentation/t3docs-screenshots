<?php

declare(strict_types=1);

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

namespace TYPO3\CMS\Screenshots\Tests\Acceptance\Support\Helper;

use Codeception\Module;

/**
 * Helper to provide screenshots of TYPO3 specific backend elements.
 */
class Screenshots extends Module
{
    public function makeScreenshotOfTable(int $pid, string $table, string $name, string $selector = ''):void
    {
        $this->goToTable($pid, $table);
        $this->makeScreenshotOfElement($name, $selector);
    }

    public function goToTable(int $pid, string $table):void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&id=%s&table=%s&imagemode=1',
            urlencode('/module/web/list'), $pid, $table)
        );
    }

    public function makeScreenshotOfRecord(string $table, int $uid, string $name, string $selector = ''):void
    {
        $this->goToRecord($table, $uid);
        $this->makeScreenshotOfElement($name, $selector);
    }

    public function goToRecord(string $table, int $uid):void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit',
            urlencode('/record/edit'), $table, $uid
        ));
    }

    public function makeScreenshotOfField(string $table, int $uid, string $fields, string $name, string $selector = ''):void
    {
        $this->goToField($table, $uid, $fields);
        $this->makeScreenshotOfElement($name, $selector);
    }

    public function goToField(string $table, int $uid, string $fields):void
    {
        $this->getModule('WebDriver')->amOnPage(sprintf(
            '/typo3/index.php?route=%s&token=1&edit[%s][%s]=edit&columnsOnly=%s',
            urlencode('/record/edit'), $table, $uid, $fields
        ));
    }

    protected function makeScreenshotOfElement(string $name, string $selector = ''):void
    {
        if (!empty($selector)) {
            $this->getModule('WebDriver')->makeElementScreenshot($selector, $name);
        } else {
            $this->getModule('WebDriver')->makeScreenshot($name);
        }
    }
}
