<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Controller;

use TYPO3\CMS\Backend\View\BackendTemplateView;
use TYPO3\CMS\Core\Authentication\BackendUserAuthentication;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;
use TYPO3\CMS\Extbase\Mvc\View\ViewInterface;

class ImageCopyController extends ActionController
{
    /**
     * Backend Template Container
     *
     * @var string
     */
    protected $defaultViewObjectName = BackendTemplateView::class;

    /**
     * BackendTemplateContainer
     *
     * @var BackendTemplateView
     */
    protected $view;

    /**
     * @var int Current page id
     */
    protected $pageUid = 0;

    protected $threshold = 0.0002;

    protected $images = [];

    /**
     * Set up the doc header properly here
     *
     * @param ViewInterface $view
     */
    protected function initializeView(ViewInterface $view)
    {
        if ($view instanceof BackendTemplateView) {
            parent::initializeView($view);
            $this->view->getModuleTemplate()->setFlashMessageQueue($this->controllerContext->getFlashMessageQueue());
        }
    }

    /**
     * Function will be called before every other action
     */
    public function initializeAction()
    {
        $this->pageUid = (int)GeneralUtility::_GET('id');

        parent::initializeAction();
    }

    public function indexAction(bool $compare = false, bool $copy = false)
    {
        if ($compare) {
            $this->compare();
        }

        if ($copy) {
            $this->copy();
        }

        $this->view->assignMultiple([
            'pageUid' => $this->pageUid,
            'images' => $this->images
        ]);
    }

    protected function compare():void
    {
        $folderOriginal = 't3docs';
        $folderActual = 't3docs-generated/actual';
        $folderDiff = 't3docs-generated/diff';

        $this->images = [];

        GeneralUtility::rmdir(GeneralUtility::getFileAbsFileName($folderDiff), true);
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
            $urls = [
                'original' => $folderOriginal . $pathRelative,
                'actual' => $folderActual . $pathRelative,
                'diff' => $folderDiff . $pathRelative
            ];

            $imageOriginal = new \Imagick($paths['original']);
            $imageActual = new \Imagick($paths['actual']);
            $diff = $imageActual->compareImages($imageOriginal, \Imagick::METRIC_MEANABSOLUTEERROR);

            if ($diff[1] > $this->threshold) {
                GeneralUtility::mkdir_deep(dirname($paths['diff']));
                GeneralUtility::writeFile($paths['diff'], $diff[0]);
                $this->images[] = [
                    'difference' => $diff[1],
                    'paths' => $paths,
                    'urls' => $urls
                ];
            }
        }
    }

    protected function copy():void
    {
        $folderOriginal = 't3docs';
        $folderActual = 't3docs-generated/actual';
        $folderDiff = 't3docs-generated/diff';

        $this->images = [];

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

            copy($paths['actual'], $paths['original']);
        }
    }

    public function compareAction():void
    {
        $this->forward('index', null, null, ['compare' => true]);
    }

    public function copyAction():void
    {
        $this->forward('index', null, null, ['copy' => true]);
    }

    /**
     * @return BackendUserAuthentication
     */
    protected function getBackendUserAuthentication()
    {
        return $GLOBALS['BE_USER'];
    }
}
