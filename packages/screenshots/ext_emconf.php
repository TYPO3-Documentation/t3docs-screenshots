<?php

$EM_CONF[$_EXTKEY] = [
    'title' => 'TYPO3 CMS Screenshots',
    'description' => 'Provide tools and runner to take scripted screenshots of the TYPO3 CMS.',
    'category' => 'plugin',
    'author' => 'TYPO3 Documentation Team',
    'author_email' => 'documentation@typo3.org',
    'state' => 'stable',
    'createDirs' => '',
    'clearCacheOnLoad' => 0,
    'version' => '10.0.0',
    'constraints' => [
        'depends' => [
            'typo3' => '10.0.0-10.99.99',
        ],
        'conflicts' => [
        ],
        'suggests' => [
        ],
    ],
];
