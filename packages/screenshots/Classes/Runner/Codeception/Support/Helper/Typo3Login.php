<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Runner\Codeception\Support\Helper;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Codeception\Exception\ConfigurationException;
use Codeception\Module;
use Codeception\Util\Locator;

/**
 * Helper class to log in TYPO3 backend users and load TYPO3 backend.
 *
 * This helper contains a slightly adapted copy of class Login of the typo3/testing-framework package.
 * It should be integrated in the typo3/testing-framework ideally. Currently it differs by:
 * - the logged-in user gets logged out, if the demanded user does not match the logged-in user
 */
class Typo3Login extends Module
{
    /**
     * @var array Filled by .yml config with valid sessions per role
     */
    protected $config = [
        'sessions' => []
    ];

    /**
     * Set a session cookie and load backend index.php
     *
     * @param string $role
     * @throws ConfigurationException
     */
    public function useExistingSession($role = '')
    {

        /** @var Module\WebDriver $wd */
        $wd = $this->getModule('WebDriver');
        if ($wd->loadSessionSnapshot('login') === false) {
            $wd->amOnPage('/typo3/index.php');
            $wd->waitForElement('body[data-typo3-login-ready]');

            $sessionCookie = '';
            if ($role) {
                if (!isset($this->config['sessions'][$role])) {
                    throw new ConfigurationException("Helper\Login doesn't have `sessions` defined for $role");
                }
                $sessionCookie = $this->config['sessions'][$role];
            }

            // @todo: There is a bug in PhantomJS / firefox (?) where adding a cookie fails.
            // This bug will be fixed in the next PhantomJS version but i also found
            // this workaround. First reset / delete the cookie and than set it and catch
            // the webdriver exception as the cookie has been set successful.
            try {
                $wd->resetCookie('be_typo_user');
                $wd->setCookie('be_typo_user', $sessionCookie);
            } catch (\Facebook\WebDriver\Exception\UnableToSetCookieException $e) {
            }
            try {
                $wd->resetCookie('be_lastLoginProvider');
                $wd->setCookie('be_lastLoginProvider', '1433416747');
            } catch (\Facebook\WebDriver\Exception\UnableToSetCookieException $e) {
            }
            $wd->saveSessionSnapshot('login');
        }

        // reload the page to have a logged in backend
        $wd->amOnPage('/typo3/index.php');

        // Ensure main content frame is fully loaded, otherwise there are load-race-conditions
        $wd->waitForElement('iframe[name="list_frame"]');
        $wd->switchToIFrame('list_frame');
        $wd->waitForElement(Locator::firstElement('div.module'));
        // And switch back to main frame preparing a click to main module for the following main test case
        $wd->switchToIFrame();
    }
}
