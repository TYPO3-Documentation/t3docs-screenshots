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
use Codeception\Module\WebDriver;
use Codeception\Util\Locator;

/**
 * Helper class to log in TYPO3 backend users and load TYPO3 backend.
 *
 * This helper contains a slightly adapted copy of class Login of the typo3/testing-framework package.
 * It should be integrated in the typo3/testing-framework ideally. Currently it differs by:
 * - the logged-in user gets logged out, if the demanded user does not match the logged-in user
 *
 * @see \TYPO3\TestingFramework\Core\Acceptance\Helper\Login
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
     * Set a session cookie and load backend index.php.
     *
     * @param string $role
     * @throws ConfigurationException
     * @throws \Codeception\Exception\ModuleException
     */
    public function useExistingSession(string $role = '')
    {
        $webDriver = $this->getModule('WebDriver');

        if ($webDriver->loadSessionSnapshot('login') === false) {
            $webDriver->amOnPage('/typo3/index.php');
            $webDriver->waitForElement('body[data-typo3-login-ready]');

            $sessionCookie = '';
            if ($role) {
                if (!isset($this->config['sessions'][$role])) {
                    throw new ConfigurationException(sprintf(
                        "Helper Typo3Login doesn't have `sessions` defined for %s.",
                        $role
                    ));
                }
                $sessionCookie = $this->config['sessions'][$role];
            }

            // @todo: There is a bug in PhantomJS / firefox (?) where adding a cookie fails.
            // This bug will be fixed in the next PhantomJS version but i also found
            // this workaround. First reset / delete the cookie and than set it and catch
            // the webdriver exception as the cookie has been set successful.
            try {
                $webDriver->resetCookie('be_typo_user');
                $webDriver->setCookie('be_typo_user', $sessionCookie);
            } catch (\Facebook\WebDriver\Exception\UnableToSetCookieException $e) {
            }
            try {
                $webDriver->resetCookie('be_lastLoginProvider');
                $webDriver->setCookie('be_lastLoginProvider', '1433416747');
            } catch (\Facebook\WebDriver\Exception\UnableToSetCookieException $e) {
            }
            $webDriver->saveSessionSnapshot('login');
        }

        // reload the page to have a logged in backend
        $webDriver->amOnPage('/typo3/index.php');

        // Ensure main content frame is fully loaded, otherwise there are load-race-conditions
        $webDriver->waitForElement('iframe[name="list_frame"]');
        $webDriver->switchToIFrame('list_frame');
        $webDriver->waitForElement(Locator::firstElement('div.module'));
        // And switch back to main frame preparing a click to main module for the following main test case
        $webDriver->switchToIFrame();
    }

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }
}
