<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\Configuration;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Core\Utility\PathUtility;

/**
 * Handle screenshots related configuration file "screenshots.json"
 */
class Configuration
{
    protected string $basePath = '/var/www/html/public/t3docs';
    protected string $fileName = 'screenshots.json';

    protected string $path;
    protected array $config;

    public function __construct(string $path = '')
    {
        $this->path = $this->getAbsolutePath($path);
        $this->config = [];
    }

    protected function getAbsolutePath(string $path): string
    {
        // Absolute paths are e.g. vfs://t3docs or /t3docs
        $isAbsolute = strpos($path, '/') === 0 || strpos($path, '://') !== false;
        $path = $isAbsolute ? $path : $this->basePath . '/' . $path;
        return PathUtility::getCanonicalPath($path);
    }

    public function read(): void
    {
        $this->config = json_decode(file_get_contents($this->getFilePath()), true) ?? [];
    }

    public function write(): void
    {
        GeneralUtility::mkdir_deep($this->path);
        file_put_contents($this->getFilePath(), $this->printAsJson());
    }

    public function getFilePath(): string
    {
        return $this->path . '/' . $this->fileName;
    }

    /**
     * Print the configuration frame pretty and use normal printing for the actions so that they consume only one line
     * each.
     *
     * @return string
     */
    protected function printAsJson(): string
    {
        $config = $this->config;
        $replace = [];

        if (!empty($config['suites'])) {
            foreach ($config['suites'] as $suiteId => &$suite) {
                if (isset($suite['screenshots'])) {
                    foreach ($suite['screenshots'] as $actionsId => &$actions) {
                        foreach ($actions as $actionId => &$action) {
                            $actionJson = str_replace(['",', '":'], ['", ', '": '], json_encode($action, JSON_UNESCAPED_SLASHES));
                            $actionIdentifier = md5(sprintf('%s_%s_%s', $suiteId, $actionsId, $actionId));
                            $replace["\"$actionIdentifier\""] = $actionJson;
                            $action = $actionIdentifier;
                        }
                    }
                }
            }
        }

        $configJson = json_encode($config, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
        $configJson = str_replace(array_keys($replace), array_values($replace), $configJson);
        return $configJson;
    }

    public function getBasePath(): string
    {
        return $this->basePath;
    }

    public function getPath(): string
    {
        return $this->path;
    }

    public function getConfig(): array
    {
        return $this->config;
    }

    public function setConfig(array $config): void
    {
        $this->config = $config;
    }

    public function createBasicConfig(): void
    {
        $this->config = [
            'suites' => [
                'Core' => [
                    'screenshots' => [
                        [
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'see', 'text' => "List"],
                            ['action' => 'click', 'link' => "List"],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "Typo3DashboardFullPage"],
                        ]
                    ]
                ],
                'Introduction' => [
                    'screenshots' => [
                        [
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'see', 'text' => "List"],
                            ['action' => 'click', 'link' => "List"],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "IntroductionDashboardFullPage"],
                        ],
                        'actionsIdentifierUserSwitch' => [
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'see', 'text' => "Backend Users"],
                            ['action' => 'click', 'link' => "Backend Users"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'waitForElement', 'element' => '[name="BackendUserModuleMenu"]', 'timeout' => 5],
                            ['action' => 'click', 'link' => "//table[@id='typo3-backend-user-list']/tbody/tr[3]//a[@title='Switch to user']"],
                            ['action' => 'waitForText', 'text' => 'SU simple-editor', 'timeout' => 5],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "IntroductionSimpleEditorSwitch"],
                            ['action' => 'click', 'link' => "SU simple-editor"],
                            ['action' => 'click', 'link' => "Exit"],
                            ['action' => 'waitForText', 'text' => 'Klaus Admin', 'timeout' => 5],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "IntroductionSimpleEditorSwitchBack"],
                        ]
                    ]
                ],
                'Styleguide' => [
                    'screenshots' => [
                        'actionsIdentifierScreenshots' => [
                            ['comment' => '********************************************************'],
                            ['comment' => 'Take screenshots configured in a dummy screenshots.json.'],
                            ['comment' => '********************************************************'],
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'setScreenshotsDocumentationPath', 'path' => "StyleguideDocumentation"],
                            ['action' => 'setScreenshotsImagePath', 'path' => "Images/StyleguideScreenshots"],
                            ['action' => 'see', 'text' => "List"],
                            ['action' => 'click', 'link' => "List"],
                            ['action' => 'openPageTreePath', 'path' => ["styleguide TCA demo", "elements rte"]],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'waitForText', 'text' => 'elements rte', 'timeout' => 5],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetList"],
                            ['action' => 'resizeToFullPage'],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "StylesheetPartiallyScrolledOutElement", 'selector' => "#t3-table-tx_styleguide_elements_rte"],
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "StylesheetListFullPage"],
                            ['action' => 'scrollModuleBodyTo', 'toSelector' => '#clipboard_form'],
                            ['action' => 'scrollModuleBodyToBottom'],
                            ['action' => 'switchToMainFrame'],
                            ['action' => 'scrollModuleMenuTo', 'toSelector' => '#system_config'],
                            ['action' => 'scrollModuleMenuToBottom'],
                            ['action' => 'scrollPageTreeToBottom'],
                            ['action' => 'scrollPageTreeTo', 'toSelector' => '#identifier-0_152'],
                            ['action' => 'scrollPageTreeToBottom'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetListScrolledDown"],
                            ['action' => 'scrollModuleMenuTo', 'toSelector' => '#web_list'],
                            ['action' => 'scrollPageTreeToTop'],
                            ['action' => 'scrollPageTreeTo', 'toSelector' => '#identifier-0_12'],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'scrollModuleBodyTo', 'toSelector' => '#t3-table-pages_translated'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetListScrolledToElement", "captionText" => "A caption text not linked"],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "StylesheetTcaTable", 'selector' => "#t3-table-pages_translated", "altText" => "This is a TCA table", "captionText" => "A caption text linked to my-reference", "captionReference" => "my-reference"],
                            ['action' => 'createScreenshotsRstFile', 'create' => false],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "StylesheetTcaTableWithoutRst", 'selector' => "#t3-table-pages_translated"],
                            ['action' => 'click', 'link' => ".btn-toolbar [title='Create a bookmark to this page']"],
                            ['action' => 'waitForModalDialogInMainFrame'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetAddToFavoritesModal"],
                            ['action' => 'clickButtonInModalDialog', 'buttonLink' => "OK"],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetAddToFavoritesModalConfirmed"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'click', 'link' => "elements rte - language 4"],
                            ['action' => 'waitForText', 'text' => 'Edit Page "elements rte - language 4"', 'timeout' => 5],
                            ['action' => 'click', 'link' => "select[name*=doktype]"],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetPageSelectboxOpen"],
                            ['action' => 'resizeWindow', 'width' => 480, 'height' => 768],
                            ['action' => 'reloadBackend'],
                            ['action' => 'click', 'link' => '.topbar-button-modulemenu'],
                            ['action' => 'wait', 'timeout' => 0.3],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetMobile"],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "StylesheetMobileFullPage"],
                            ['action' => 'click', 'link' => '.topbar-button-modulemenu'],
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'see', 'text' => "Filelist"],
                            ['action' => 'click', 'link' => "Filelist"],
                            ['action' => 'openFileTreePath', 'path' => ["fileadmin", "styleguide"]],
                            ['action' => 'scrollFileTreeToTop'],
                            ['action' => 'scrollFileTreeToBottom'],
                            ['action' => 'scrollFileTreeTo', 'toSelector' => '#identifier-1_107375831'],
                            ['action' => 'wait', 'timeout' => 1],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetFilelist"],
                        ],
                        'actionsIdentifierScreenshotsOfContentFrameOnly' => [
                            ['action' => 'setScreenshotsDefaultPid', 'pid' => 22],
                            ['action' => 'setScreenshotsDefaultTable', 'table' => 'tx_styleguide_elements_basic'],
                            ['action' => 'setScreenshotsDefaultUid', 'uid' => 1],
                            ['action' => 'makeScreenshotOfTable', 'fileName' => 'TxStyleguideElementsBasicOfPid22'],
                            ['action' => 'makeScreenshotOfTable', 'pid' => '27', 'table' => 'tx_styleguide_elements_group', 'fileName' => 'TxStyleguideElementsGroupOfPid27'],
                            [
                                'action' => 'makeScreenshotOfTable',
                                'pid' => ['action' => 'getUidByField', 'table' => 'pages', 'field' => 'title', 'value' => 'elements group'],
                                'table' => 'tx_styleguide_elements_group',
                                'fileName' => 'TxStyleguideElementsGroupOfPageWithSpecificTitle'
                            ],
                            ['action' => 'makeScreenshotOfRecord', 'fileName' => 'TxStyleguideElementsBasicWithUid1'],
                            ['action' => 'makeScreenshotOfRecord', 'table' => 'tx_styleguide_elements_group', 'uid' => 3, 'fileName' => 'TxStyleguideElementsGroupWithUid3'],
                            ['action' => 'makeScreenshotOfField', 'fields' => 'input_1', 'fileName' => 'TxStyleguideElementsBasicWithUid1AndFieldInput1'],
                            ['action' => 'makeScreenshotOfField', 'table' => 'tx_styleguide_elements_group', 'uid' => 3, 'fields' => 'group_db_1', 'fileName' => 'TxStyleguideElementsGroupWithUid3AndFieldGroupDb1'],
                            ['action' => 'clearScreenshotsDefaults'],
                            ['action' => 'reloadBackend'],
                        ],
                        'actionsIdentifierCodeSnippets' => [
                            ['action' => 'setCodeSnippetsTargetPath', 'path' => "CodeSnippets/StyleguideCode"],
                            ['action' => 'createCodeSnippet', 'sourceFile' => 'typo3/sysext/core/Configuration/TCA/be_groups.php', 'targetFileName' => 'BeGroups'],
                            ['action' => 'setCodeSnippetsSourcePath', 'path' => "typo3/sysext/core"],
                            ['action' => 'createCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'targetFileName' => 'BeGroupsWithPresetSourcePath'],
                            ['action' => 'createPhpArrayCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'targetFileName' => 'TcaBeGroups'],
                            ['action' => 'createPhpArrayCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'field' => 'columns/title', 'targetFileName' => 'TcaBeGroupsColumnsTitle'],
                        ],
                        'actionsIdentifierDraw' => [
                            ['action' => 'switchToMainFrame'],
                            ['action' => 'see', 'text' => "Dashboard"],
                            ['action' => 'click', 'link' => "Dashboard"],
                            ['action' => 'drawBox', 'selector' => '#dashboard'],
                            ['action' => 'drawArrow', 'selector' => '#dashboard', 'position' => 'right-bottom'],
                            ['action' => 'drawBadge', 'selector' => '#dashboard', 'label' => 'Click here', 'position' => 'bottom'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetDashboardWithHighlightedMenuitem"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'scrollModuleBodyTo', 'toSelector' => '(//*[contains(@class, "dashboard-item-content")])[2]'],
                            ['action' => 'drawBox', 'selector' => '(//*[contains(@class, "dashboard-item-content")])[2]'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetDashboardWithHighlightedDashboardItem"],
                            ['action' => 'clearDrawings'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StylesheetDashboardWithClearedHighlights"],
                            ['action' => 'goToTable', "pid" => 22, "table" => "tx_styleguide_elements_basic"],
                            ['action' => 'drawBox', 'selector' => 'h1'],
                            ['action' => 'drawArrow', 'selector' => 'h1', 'position' => 'center-bottom'],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "TxStyleguideElementsBasicWithHighlightsAndFullpage"],
                            ['action' => 'clearDrawings'],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "TxStyleguideElementsBasicWithClearedHighlightsAndFullpage"],
                        ]
                    ]
                ]
            ]
        ];
    }
}
