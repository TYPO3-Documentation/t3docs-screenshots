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
 * The modal dialog is located in the TYPO3 backend main frame. It contains the content
 * either in the modal body or in the modal frame. With the latter, one must first switch
 * to the modal frame before performing any further actions on the content, such as
 * scrolling or drawing. After that, one has to switch back to the main frame before
 * clicking buttons of the header or footer of the modal dialog.
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
     * Scroll the modal dialog body up to show the given element at the top.
     *
     * ``` php
     * <?php
     * $I->scrollModalDialogBodyTo("//h4[contains(., 'Install extension \"rsaauth\"')]");
     * ?>
     * ```
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollModalDialogBodyTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $frameSelector = ['css' => '.modal.show .modal-body'];
        $offsetY = $offsetY + $this->getModalDialogHeaderHeight() + 16 + 10;

        $this->getTypo3Navigation()->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
    }

    protected function getModalDialogHeaderHeight(): int
    {
        /** @var WebDriverElement[] $elements */
        $elements = $this->getWebDriver()->_findElements(['css' => '.modal.show .modal-header']);
        if (count($elements) > 0) {
            return $elements[0]->getSize()->getHeight();
        }
        return 0;
    }

    /**
     * Scroll the modal dialog body to top.
     */
    public function scrollModalDialogBodyToTop(): void
    {
        $frameSelector = ['css' => '.modal.show .modal-body'];
        $this->getTypo3Navigation()->_scrollFrameToTop($frameSelector);
    }

    /**
     * Scroll the modal dialog body to the bottom.
     */
    public function scrollModalDialogBodyToBottom(): void
    {
        $frameSelector = ['css' => '.modal.show .modal-body'];
        $this->getTypo3Navigation()->_scrollFrameToBottom($frameSelector);
    }

    /**
     * Switch to modal dialog frame, the one with the modal content.
     *
     * Note 1: Not every modal dialog has a frame. The content might be in the modal dialog body instead.
     * Note 2: Switch back to the main frame when being done in the modal dialog frame.
     *
     * @see Typo3Navigation::switchToMainFrame()
     */
    public function switchToModalDialogFrame(): void
    {
        $this->getWebDriver()->switchToIFrame('modal_frame');
    }

    /**
     * Scroll the modal dialog frame up to show the given element at the top.
     *
     * ``` php
     * <?php
     * $I->scrollModalDialogFrameTo("table");
     * ?>
     * ```
     *
     * @param string $toSelector
     * @param int $offsetX
     * @param int $offsetY
     */
    public function scrollModalDialogFrameTo(string $toSelector, int $offsetX = 0, int $offsetY = 0): void
    {
        $frameSelector = ['css' => '.module'];
        $offsetY = $offsetY + 10;

        $this->getTypo3Navigation()->_scrollFrameTo($frameSelector, $toSelector, $offsetX, $offsetY);
    }

    public function scrollModalDialogFrameToTop(): void
    {
        $frameSelector = ['css' => '.module'];

        $this->getTypo3Navigation()->_scrollFrameToTop($frameSelector);
    }

    public function scrollModalDialogFrameToBottom(): void
    {
        $frameSelector = ['css' => '.module'];

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
