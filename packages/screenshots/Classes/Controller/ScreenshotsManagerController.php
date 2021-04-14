<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Controller;

use SensioLabs\AnsiConverter\AnsiToHtmlConverter;
use TYPO3\CMS\Backend\View\BackendTemplateView;
use TYPO3\CMS\Core\Page\PageRenderer;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;
use TYPO3\CMS\Extbase\Mvc\View\ViewInterface;

class ScreenshotsManagerController extends ActionController
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

    protected float $threshold = 0.0002;

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

    protected function initializeAction(): void
    {
        /** @var PageRenderer $pageRenderer */
        $pageRenderer = GeneralUtility::makeInstance(PageRenderer::class);
        $pageRenderer->addCssFile('EXT:screenshots/Resources/Public/Css/screenshots-manager.css');
    }

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
    }

    public function compareAction(): void
    {
        $folderOriginal = 't3docs';
        $folderActual = 't3docs-generated/actual';
        $folderDiff = 't3docs-generated/diff';

        $images = [];

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

            if (is_file($paths['original']) === false) {
                $imageActual = new \Imagick($paths['actual']);
                $paths['original'] = $paths['diff'] = '';
                $urls['original'] = $urls['diff'] = '';

                GeneralUtility::mkdir_deep(dirname($paths['diff']));
                $images[] = [
                    'difference' => 1,
                    'maxHeight' => $imageActual->getImageHeight(),
                    'paths' => $paths,
                    'urls' => $urls
                ];
            } else {
                $imageActual = new \Imagick($paths['actual']);
                $imageOriginal = new \Imagick($paths['original']);
                $diff = $imageActual->compareImages($imageOriginal, \Imagick::METRIC_MEANABSOLUTEERROR);

                if ($diff[1] > $this->threshold) {
                    GeneralUtility::mkdir_deep(dirname($paths['diff']));
                    GeneralUtility::writeFile($paths['diff'], $diff[0]);
                    $images[] = [
                        'difference' => $diff[1],
                        'maxHeight' => max($imageActual->getImageHeight(), $imageOriginal->getImageHeight()),
                        'paths' => $paths,
                        'urls' => $urls
                    ];
                }
            }
        }

        $this->view->assign('images', $images);
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

        $this->view->assign('files', $files);
    }
}
