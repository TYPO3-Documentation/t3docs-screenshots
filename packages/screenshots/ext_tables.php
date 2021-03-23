<?php

defined('TYPO3_MODE') or die();

\TYPO3\CMS\Extbase\Utility\ExtensionUtility::registerModule(
    'Screenshots',
    'tools',
    'screenshots',
    '',
    [
        \TYPO3\CMS\Screenshots\Controller\ImageCopyController::class => 'index, compare, copy',
    ],
    [
        'access' => 'user,group',
        'icon'   => 'EXT:screenshots/Resources/Public/Icons/module-screenshots.svg',
        'labels' => 'LLL:EXT:screenshots/Resources/Private/Language/locallang_mod.xlf',
    ]
);
