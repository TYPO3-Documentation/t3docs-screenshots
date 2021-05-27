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
 * - the logged-in user will be logged out if the requested user does not match the logged-in user
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
     * Set a TYPO3 backend user session cookie and load the TYPO3 backend index.php.
     *
     * Use this action to change the TYPO3 backend user and avoid switching between users in the TYPO3 backend module
     * "Backend Users" as this will change the user session ID and make it useless for subsequent calls of this action.
     *
     * @param string $role The backend user who should be logged in.
     * @throws ConfigurationException
     */
    public function useExistingSession(string $role = '')
    {
        $webDriver = $this->getModule('WebDriver');

        $newUserSessionId = $this->getUserSessionIdByRole($role);

        $hasSession = $this->_loadSession();
        if ($hasSession && $newUserSessionId !== '' && $newUserSessionId !== $this->getUserSessionId()) {
            $this->_deleteSession();
            $hasSession = false;
        }

        if (!$hasSession) {
            $webDriver->amOnPage('/typo3/index.php');
            $webDriver->waitForElement('body[data-typo3-login-ready]');
            $this->_createSession($newUserSessionId);
        }

        // Reload the page to have a logged in backend.
        $webDriver->amOnPage('/typo3/index.php');

        // Ensure main content frame is fully loaded, otherwise there are load-race-conditions ..
        $webDriver->waitForElement('iframe[name="list_frame"]');
        $webDriver->switchToIFrame('list_frame');
        $webDriver->waitForElement(Locator::firstElement('div.module'));
        // .. and switch back to main frame.
        $webDriver->switchToIFrame();
    }

    protected function getUserSessionIdByRole(string $role): string
    {
        if (empty($role)) {
            return '';
        }

        if (!isset($this->_getConfig('sessions')[$role])) {
            throw new ConfigurationException(sprintf(
                'Backend user session ID cannot be resolved for role "%s": ' .
                'Set session ID explicitly in configuration of module Typo3Login.',
                $role
            ), 4001);
        }

        return $this->_getConfig('sessions')[$role];
    }

    public function _loadSession(): bool
    {
        return $this->getWebDriver()->loadSessionSnapshot('login');
    }

    public function _deleteSession(): void
    {
        $webDriver = $this->getModule('WebDriver');
        $webDriver->resetCookie('be_typo_user');
        $webDriver->resetCookie('be_lastLoginProvider');
        $webDriver->deleteSessionSnapshot('login');
    }

    public function _createSession(string $userSessionId): void
    {
        $webDriver = $this->getModule('WebDriver');
        $webDriver->setCookie('be_typo_user', $userSessionId);
        $webDriver->setCookie('be_lastLoginProvider', '1433416747');
        $webDriver->saveSessionSnapshot('login');
    }

    protected function getUserSessionId(): string
    {
        $userSessionId = $this->getWebDriver()->grabCookie('be_typo_user');
        return $userSessionId ?? '';
    }

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }
}
