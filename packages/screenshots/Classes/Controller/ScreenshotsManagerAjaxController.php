<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Controller;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use TYPO3\CMS\Core\Http\JsonResponse;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;
use TYPO3\Documentation\Screenshots\Configuration\ExtensionConfiguration;
use TYPO3\Documentation\Screenshots\Util\FileHelper;

class ScreenshotsManagerAjaxController extends ActionController
{

    public function getFolders(ServerRequestInterface $request): ResponseInterface
    {
        $pathActual = $this->getExtensionConfiguration()->getAbsoluteActualPath();

        $folders = GeneralUtility::removePrefixPathFromList(
            FileHelper::getFoldersRecursively($pathActual), $pathActual
        );

        $suggestions = [];
        foreach ($folders as $folder) {
            $suggestions[] = ['value' => $folder, 'data' => $folder];
        }

        return new JsonResponse($suggestions);
    }

    protected function getExtensionConfiguration(): ExtensionConfiguration
    {
        return GeneralUtility::makeInstance(ExtensionConfiguration::class);
    }
}
