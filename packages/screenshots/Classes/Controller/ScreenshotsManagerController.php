<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Controller;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use SensioLabs\AnsiConverter\AnsiToHtmlConverter;
use TYPO3\CMS\Core\Authentication\BackendUserAuthentication;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;
use TYPO3\CMS\Fluid\ViewHelpers\Be\InfoboxViewHelper;
use TYPO3\CMS\Screenshots\Comparison\ImageComparison;

class ScreenshotsManagerController extends ActionController
{
    protected float $threshold = 0.0002;

    public function indexAction()
    {
    }

    public function makeAction(): void
    {
        $command = 'typo3DatabaseName=func_test typo3DatabaseUsername=root typo3DatabasePassword=root typo3DatabaseHost=db ' .
            '/var/www/html/vendor/bin/codecept run -d -c /var/www/html/public/typo3conf/ext/screenshots/Classes/Runner/codeception.yml';

        $output = sprintf('$ %s', $command) . "\n";
        exec($command . " 2>&1", $outputArray, $resultCode);
        $output .= implode("\n", $outputArray);

        $converter = new AnsiToHtmlConverter();
        $outputHtml = $converter->convert($output);

        $this->view->assign('outputHtml', $outputHtml);
        $this->view->assign('resultCode', $resultCode);
        $this->view->assign('messages', $this->fetchMessages());
    }

    public function compareAction(): void
    {
        $folderOriginal = 't3docs';
        $folderActual = 't3docs-generated/actual';
        $folderDiff = 't3docs-generated/diff';

        $comparisons = [];

        $pathOriginal = GeneralUtility::getFileAbsFileName($folderOriginal);
        $pathActual = GeneralUtility::getFileAbsFileName($folderActual);
        $pathDiff = GeneralUtility::getFileAbsFileName($folderDiff);

        GeneralUtility::rmdir($pathDiff, true);
        $files = GeneralUtility::removePrefixPathFromList(GeneralUtility::getAllFilesAndFoldersInPath(
            [], $pathActual . '/', 'gif,jpg,jpeg,png,bmp'
        ), $pathActual);

        foreach ($files as $file) {
            $comparison = new ImageComparison(
                $pathActual . $file,
                $pathOriginal . $file,
                $pathDiff . $file,
                '/' . $folderActual . $file,
                '/' . $folderOriginal . $file,
                '/' . $folderDiff . $file,
                $this->threshold
            );
            $comparison->process();
            if ($comparison->getDifference() > $this->threshold) {
                $comparisons[] = $comparison;
            }
        }

        $this->view->assign('comparisons', $comparisons);
        $this->view->assign('messages', $this->fetchMessages());
    }

    public function copyAction(): void
    {
        $folderOriginal = 't3docs';
        $folderActual = 't3docs-generated/actual';
        $folderDiff = 't3docs-generated/diff';

        $files = GeneralUtility::getAllFilesAndFoldersInPath([], GeneralUtility::getFileAbsFileName($folderActual) . '/');

        $folderActualLength = strlen(GeneralUtility::getFileAbsFileName($folderActual));
        foreach ($files as $file) {
            $pathRelative = substr($file, $folderActualLength);
            $paths = [
                'relative' => $pathRelative,
                'original' => GeneralUtility::getFileAbsFileName($folderOriginal . $pathRelative),
                'actual' => GeneralUtility::getFileAbsFileName($folderActual . $pathRelative),
                'diff' => GeneralUtility::getFileAbsFileName($folderDiff . $pathRelative)
            ];

            GeneralUtility::mkdir_deep(dirname($paths['original']));
            copy($paths['actual'], $paths['original']);
        }

        if (count($files) > 0) {
            $this->pushMessage(sprintf('%s images copied.', count($files)), InfoboxViewHelper::STATE_OK);
        } else {
            $this->pushMessage('No images copied.', InfoboxViewHelper::STATE_OK);
        }

        $this->redirect('compare');
    }

    /**
     * Add a message to the module internal message stack. They are displayed as infoboxes at a user-defined
     * position in the template. Survives redirects similar to $this->addFlashMessage().
     *
     * @param string $message
     * @param int $state An InfoboxViewHelper state.
     */
    protected function pushMessage(string $message, int $state): void
    {
        $moduleData = $this->getBackendUser()->getModuleData('tx_screenshots');
        $moduleData['messages'][] = ['message' => $message, 'state' => $state];
        $this->getBackendUser()->pushModuleData('tx_screenshots', $moduleData);
    }

    /**
     * Retrieve messages from the module internal message stack.
     *
     * @return array
     */
    protected function fetchMessages(): array
    {
        $messages = [];

        $moduleData = $this->getBackendUser()->getModuleData('tx_screenshots');
        if (isset($moduleData['messages'])) {
            $messages = $moduleData['messages'];
            unset($moduleData['messages']);
            $this->getBackendUser()->pushModuleData('tx_screenshots', $moduleData);
        }

        return $messages;
    }

    /**
     * @return BackendUserAuthentication
     */
    protected function getBackendUser(): BackendUserAuthentication
    {
        return $GLOBALS['BE_USER'];
    }
}
