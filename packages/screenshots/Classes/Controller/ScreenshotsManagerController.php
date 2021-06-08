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
use TYPO3\CMS\Core\Page\PageRenderer;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;
use TYPO3\CMS\Extbase\Mvc\View\ViewInterface;
use TYPO3\CMS\Fluid\ViewHelpers\Be\InfoboxViewHelper;
use TYPO3\CMS\Screenshots\Comparison\File;
use TYPO3\CMS\Screenshots\Comparison\ImageComparison;
use TYPO3\CMS\Screenshots\Configuration\ConfigurationRepository;
use TYPO3\CMS\Screenshots\Util\FileHelper;

class ScreenshotsManagerController extends ActionController
{
    protected float $threshold = 0.0002;
    protected array $imageExtensions = ['gif', 'jpg', 'jpeg', 'png', 'bmp'];

    protected PageRenderer $pageRenderer;
    protected ConfigurationRepository $configurationRepository;

    public function injectPageRenderer(PageRenderer $pageRenderer)
    {
        $this->pageRenderer = $pageRenderer;
    }

    public function __construct()
    {
        $originalPath = '/var/www/html/public/t3docs';

        $this->configurationRepository = GeneralUtility::makeInstance(
            ConfigurationRepository::class, $originalPath
        );
    }

    protected function initializeView(ViewInterface $view)
    {
        parent::initializeView($view);

        $this->pageRenderer->addInlineLanguageLabelFile('EXT:screenshots/Resources/Private/Language/locallang_mod.xlf');
        $this->pageRenderer->addCssFile('EXT:screenshots/Resources/Public/Css/screenshots-manager.css');
        $this->pageRenderer->loadRequireJsModule('TYPO3/CMS/Screenshots/ScreenshotsManager');
    }

    public function indexAction()
    {
    }

    public function makeAction(
        string $cmd = 'show',
        string $pathFilter = '',
        string $suiteFilter = '',
        string $actionsIdFilter = ''
    ): void
    {
        if ($cmd === 'make') {
            $this->make($pathFilter, $suiteFilter, $actionsIdFilter);
        }

        $configurations = $this->configurationRepository->findAll();

        $actionsIds = [];
        foreach ($configurations as &$configuration) {
            $configuration->read();
            foreach ($configuration->getActionsIds() as $actionsId) {
                if (!isset($actionsIds[$actionsId])) {
                    $actionsIds[$actionsId] = $actionsId;
                }
            }
        }

        $this->view->assign('cmd', $cmd);
        $this->view->assign('pathFilter', $pathFilter);
        $this->view->assign('suiteFilter', $suiteFilter);
        $this->view->assign('actionsIdFilter', $actionsIdFilter);
        $this->view->assign('configurations', $configurations);
        $this->view->assign('actionsIds', $actionsIds);
        $this->view->assign('messages', $this->fetchMessages());
    }

    protected function make(string $pathFilter = '', string $suiteFilter = '', string $actionsIdFilter = ''): void
    {
        $resultCode = 0;

        $output = $this->executeCommandAndFetchOutput(
            'typo3 screenshots:cleanup',
            $resultCode
        );
        $output .= "\n";
        $output .= $this->executeCommandAndFetchOutput(
            sprintf(
                'screenshotsPathFilter=%s ' .
                'screenshotsActionsIdFilter=%s ' .
                'typo3DatabaseName=func_test ' .
                'typo3DatabaseUsername=root ' .
                'typo3DatabasePassword=root ' .
                'typo3DatabaseHost=db ' .
                '/var/www/html/vendor/bin/codecept run -d ' .
                '-c /var/www/html/public/typo3conf/ext/screenshots/Classes/Runner/codeception.yml ' .
                '%s',
                $pathFilter, $actionsIdFilter, $suiteFilter
            ),
            $resultCode
        );

        $converter = new AnsiToHtmlConverter();
        $outputHtml = $converter->convert($output);

        if ($resultCode === 0) {
            $link = sprintf('<a href="%s">next</a>', $this->uriBuilder->reset()->uriFor('compare'));
            $message = sprintf(
                'Successfully created screenshots. You will probably compare them with the original ones %s.',
                $link
            );
            $this->pushMessage($message, InfoboxViewHelper::STATE_OK);
        } else {
            $message = 'Creating screenshots has failed. Please find the details below.';
            $this->pushMessage($message, InfoboxViewHelper::STATE_ERROR);
        }

        $this->view->assign('outputHtml', $outputHtml);
    }

    protected function executeCommandAndFetchOutput(string $command, int &$lastResultCode): string
    {
        if ($lastResultCode === 0) {
            $output = sprintf('$ %s', $command) . "\n";
            exec($command . " 2>&1", $outputArray, $lastResultCode);
            $output .= implode("\n", $outputArray);
        } else {
            $output = sprintf('$ %s', $command) . "\n";
            $output .= "=> skip" . "\n";
        }

        return $output;
    }

    public function compareAction(
        string $cmd = 'show',
        string $search = '',
        array $imagesToCopy = [],
        array $textFilesToCopy = [],
        int $numImages = 0,
        int $numTextFiles = 0
    ): void
    {
        if ($cmd === 'compare') {
            $this->compare($search);
        }
        elseif ($cmd === 'copy') {
            $this->copy($imagesToCopy, $textFilesToCopy, $numImages, $numTextFiles);
            $this->compare($search);
        }

        $this->view->assign('cmd', $cmd);
        $this->view->assign('messages', $this->fetchMessages());
    }

    protected function compare(string $search): void
    {
        $folderOriginal = 't3docs';
        $folderActual = 't3docs-generated/actual';
        $folderDiff = 't3docs-generated/diff';

        $pathOriginal = GeneralUtility::getFileAbsFileName($folderOriginal);
        $pathActual = GeneralUtility::getFileAbsFileName($folderActual);
        $pathDiff = GeneralUtility::getFileAbsFileName($folderDiff);

        $urlActual = '/' . $folderActual;
        $urlOriginal = '/' . $folderOriginal;
        $urlDiff = '/' . $folderDiff;

        GeneralUtility::rmdir($pathDiff, true);
        $files = GeneralUtility::removePrefixPathFromList(GeneralUtility::getAllFilesAndFoldersInPath(
            [], $pathActual . '/'
        ), $pathActual);

        $imageExtensionsIndex = array_flip($this->imageExtensions);

        $imageComparisons = [];
        $textFiles = [];
        $numImagesFilteredOut = 0;
        $numTextFilesFilteredOut = 0;
        foreach ($files as $file) {
            $fileExtension = pathinfo($file, PATHINFO_EXTENSION);

            if (isset($imageExtensionsIndex[$fileExtension])) {
                if ($this->isSearchTermMatchingFilePath($search, $file)) {
                    $imageComparison = new ImageComparison(
                        $pathActual . $file,
                        $pathOriginal . $file,
                        $pathDiff . $file,
                        $urlActual . $file,
                        $urlOriginal . $file,
                        $urlDiff . $file,
                        $this->threshold
                    );
                    $imageComparison->process();
                    if ($imageComparison->getDifference() > $this->threshold) {
                        $imageComparisons[] = $imageComparison;
                    }
                } else {
                    $numImagesFilteredOut++;
                }
            } else {
                if ($this->isSearchTermMatchingFilePath($search, $file)) {
                    $textFiles[] = new File($pathActual . $file, $urlActual . $file);
                } else {
                    $numTextFilesFilteredOut++;
                }
            }
        }

        $this->view->assign('imageComparisons', $imageComparisons);
        $this->view->assign('textFiles', $textFiles);
        $this->view->assign('numImagesFilteredOut', $numImagesFilteredOut);
        $this->view->assign('numTextFilesFilteredOut', $numTextFilesFilteredOut);
        $this->view->assign('search', $search);
    }

    protected function isSearchTermMatchingFilePath(string $search, string $filePath): bool
    {
        if (empty($search)) {
            return true;
        }

        $isSearchByRegexp = strpos($search, '#') === 0;
        if ($isSearchByRegexp) {
            return preg_match($search, $filePath) === 1;
        } else {
            return strpos($filePath, $search) !== false;
        }
    }

    protected function copy(array $imagesToCopy, array $textFilesToCopy, int $numImages, int $numTextFiles): void
    {
        $folderOriginal = 't3docs';
        $folderActual = 't3docs-generated/actual';

        $pathOriginal = GeneralUtility::getFileAbsFileName($folderOriginal);
        $pathActual = GeneralUtility::getFileAbsFileName($folderActual);

        $urlActual = '/' . $folderActual;

        $files = GeneralUtility::removePrefixPathFromList(GeneralUtility::getAllFilesAndFoldersInPath(
            [], $pathActual . '/'
        ), $pathActual);

        $imageExtensionsIndex = array_flip($this->imageExtensions);
        $imagesToCopyIndex = array_flip($imagesToCopy);
        $textFilesToCopyIndex = array_flip($textFilesToCopy);

        $numCopiedImages = 0;
        $numCopiedFiles = 0;
        foreach ($files as $file) {
            $fileExtension = pathinfo($file, PATHINFO_EXTENSION);

            if (isset($imageExtensionsIndex[$fileExtension])) {
                $image = new File($pathActual . $file, $urlActual . $file);
                if (isset($imagesToCopyIndex[$image->getHash()])) {
                    $image->copy($pathOriginal . $file);
                    $numCopiedImages++;
                }
            } else {
                $textFile = new File($pathActual . $file, $urlActual . $file);
                if (isset($textFilesToCopyIndex[$textFile->getHash()])) {
                    $textFile->copy($pathOriginal . $file);
                    $numCopiedFiles++;
                }
            }
        }

        if ($numImages === 1) {
            $message = sprintf('%d of %d image ', $numCopiedImages, $numImages);
        } else {
            $message = sprintf('%d of %d images ', $numCopiedImages, $numImages);
        }
        if ($numCopiedFiles === 1) {
            $message .= sprintf('and %d of %d code snippet and reST include file copied.', $numCopiedFiles, $numTextFiles);
        } else {
            $message .= sprintf('and %d of %d code snippets and reST include files copied.', $numCopiedFiles, $numTextFiles);
        }
        $this->pushMessage($message, InfoboxViewHelper::STATE_OK);
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
