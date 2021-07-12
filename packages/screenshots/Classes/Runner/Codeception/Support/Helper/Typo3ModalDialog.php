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

use Codeception\Module;
use Codeception\Module\WebDriver;
use Facebook\WebDriver\WebDriverElement;

/**
 * Helper to support comfortable navigation of the TYPO3 backend modal dialog.
 *
 * This helper contains an adapted copy of class ModalDialog of the typo3/core package.
 * It should be integrated in the typo3/testing-framework ideally. Currently it differs by:
 * - adding the actions to the actor instead of providing an own class
 *   to prevent additional injections in testing classes
 * - support of closing the modal dialog
 * - support of switching to modal dialog frame
 * - support of modal dialog body and modal dialog frame scrolling
 */
class Typo3ModalDialog extends Module
{
    public function waitForAndClickModalDialogInMainFrame(string $buttonLink): void
    {
        $this->waitForModalDialogInMainFrame();
        $this->clickButtonInModalDialog($buttonLink);
    }

    public function waitForModalDialogInMainFrame(): void
    {
        $this->getTypo3Navigation()->switchToMainFrame();

        $webDriver = $this->getWebDriver();
        $webDriver->waitForElement(['css' => '.modal.show']);
        $webDriver->wait(0.5);
    }

    public function clickButtonInModalDialog(string $buttonLink): void
    {
        $webDriver = $this->getWebDriver();
        $webDriver->click($buttonLink, ['css' => '.modal.show .modal-footer']);
        $webDriver->waitForElementNotVisible(['css' => '.modal.show']);
        $webDriver->wait(0.5);
    }

    public function closeModalDialog(): void
    {
        $webDriver = $this->getWebDriver();
        $webDriver->click('.close', ['css' => '.modal.show .modal-header']);
        $webDriver->waitForElementNotVisible(['css' => '.modal.show']);
        $webDriver->wait(0.5);
    }

    /**
     * Check if there is a TYPO3 backend modal dialog frame.
     *
     * The modal dialog either contains the content directly in its body or in an Iframe of its body.
     *
     * @return bool
     */
    public function _hasModalDialogFrame(): bool
    {
        $frameSelector = ['css' => '.modal.show .modal-body [name=modal_frame]'];
        return count($this->getWebDriver()->_findElements($frameSelector)) > 0;
    }

    /**
     * Switch to TYPO3 backend modal dialog frame, the one with the modal content.
     */
    public function switchToModalDialogFrame(): void
    {
        $webDriver = $this->getWebDriver();
        $webDriver->switchToIFrame('modal_frame');
    }

    /**
     * Scroll the modal dialog up to show the given element at the top.
     *
     * ``` php
     * <?php
     * $I->scrollModalDialogTo("//h4[contains(., 'Install extension \"rsaauth\"')]");
     * ?>
     * ```
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollModalDialogTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        if ($this->_hasModalDialogFrame()) {
            $this->scrollModalDialogFrameTo($toSelector, $offsetX, $offsetY);
        } else {
            $this->scrollModalDialogBodyTo($toSelector, $offsetX, $offsetY);
        }
    }

    protected function scrollModalDialogFrameTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $typo3Navigation = $this->getTypo3Navigation();

        $frameSelector = ['css' => '.module'];
        $offsetY = $offsetY + 10;

        $this->switchToModalDialogFrame();
        $typo3Navigation->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
        $typo3Navigation->switchToMainFrame();
    }

    protected function scrollModalDialogBodyTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $frameSelector = ['css' => '.modal.show .modal-body'];
        $offsetY = $offsetY + $this->_getModalDialogHeaderHeight() + 16 + 10;

        $this->getTypo3Navigation()->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
    }

    public function _getModalDialogHeaderHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['css' => '.modal.show .modal-header']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    /**
     * Scroll the modal dialog of the main frame to top.
     */
    public function scrollModalDialogToTop(): void
    {
        if ($this->_hasModalDialogFrame()) {
            $this->scrollModalDialogFrameToTop();
        } else {
            $this->scrollModalDialogBodyToTop();
        }
    }

    protected function scrollModalDialogFrameToTop(): void
    {
        $typo3Navigation = $this->getTypo3Navigation();

        $frameSelector = ['css' => '.module'];

        $this->switchToModalDialogFrame();
        $typo3Navigation->_scrollFrameToTop($frameSelector);
        $typo3Navigation->switchToMainFrame();
    }

    protected function scrollModalDialogBodyToTop(): void
    {
        $frameSelector = ['css' => '.modal.show .modal-body'];
        $this->getTypo3Navigation()->_scrollFrameToTop($frameSelector);
    }

    /**
     * Scroll the modal dialog of the main frame to the bottom.
     */
    public function scrollModalDialogToBottom(): void
    {
        if ($this->_hasModalDialogFrame()) {
            $this->scrollModalDialogFrameToBottom();
        } else {
            $this->scrollModalDialogBodyToBottom();
        }
    }

    protected function scrollModalDialogFrameToBottom(): void
    {
        $typo3Navigation = $this->getTypo3Navigation();

        $frameSelector = ['css' => '.module'];

        $this->switchToModalDialogFrame();
        $typo3Navigation->_scrollFrameToBottom($frameSelector);
        $typo3Navigation->switchToMainFrame();
    }

    /**
     * Move the modal dialog of the main frame to the bottom.
     */
    protected function scrollModalDialogBodyToBottom(): void
    {
        $frameSelector = ['css' => '.modal.show .modal-body'];
        $this->getTypo3Navigation()->_scrollFrameToBottom($frameSelector);
    }

    protected function getWebDriver(): WebDriver
    {
        return $this->getModule('WebDriver');
    }

    protected function getTypo3Navigation(): Typo3Navigation
    {
        return $this->getModule(Typo3Navigation::class);
    }
}
