<?php

/**
 * Definitions for routes provided by EXT:screenshots
 * Contains all AJAX-based routes for entry points
 */
return [
    'screenshots_folders' => [
        'path' => '/screenshots/folders',
        'access' => 'public',
        'target' => \TYPO3\CMS\Screenshots\Controller\ScreenshotsManagerAjaxController::class . '::getFolders'
    ]
];
