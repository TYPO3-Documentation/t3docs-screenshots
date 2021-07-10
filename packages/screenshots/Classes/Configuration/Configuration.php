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
use TYPO3\CMS\Screenshots\Util\JsonHelper;

/**
 * Handle screenshots related configuration file "screenshots.json"
 */
class Configuration
{
    protected string $fileName = 'screenshots.json';

    protected string $path;
    protected array $config;
    protected array $configPrepared;
    protected bool $existing;

    public function __construct(string $path = '')
    {
        $this->path = $path;
        $this->config = [];
        $this->configPrepared = [];
        $this->refresh();
    }

    protected function refresh(): void
    {
        if (is_file($this->getFilePath())) {
            $this->existing = true;
        } else {
            $this->existing = false;
        }
    }

    public function getFilePath(): string
    {
        return $this->path . '/' . $this->fileName;
    }

    public function read(): void
    {
        try {
            $config = JsonHelper::parseArrayFromJson(file_get_contents($this->getFilePath()));
            $this->setConfig($config);
        } catch (\JsonException $e) {
            throw new \JsonException(
                sprintf('%s in %s', $e->getMessage(), $this->getFilePath()),
                $e->getCode(),
                $e->getPrevious()
            );
        }
    }

    public function setConfig(array $config): void
    {
        $this->config = $config;
        $this->prepareConfig();
    }

    protected function prepareConfig(): void
    {
        $config = $this->config;

        $this->resolveIncludes($config);
        $this->removeNotExecutableActionsIds($config);

        $this->configPrepared = $config;
    }

    protected function resolveIncludes(array &$config): void
    {
        if (!empty($config['suites'])) {
            foreach ($config['suites'] as $suiteId => &$suite) {
                if (isset($suite['screenshots'])) {
                    foreach ($suite['screenshots'] as $actionsId => &$actions) {
                        foreach ($actions as $position => &$action) {
                            if (isset($action['include']) && count($action) === 1) {
                                $includeActions = $this->resolveInclude($suiteId, $action['include']);
                                array_splice($actions, $position, 1, $includeActions);
                            }
                        }
                    }
                }
            }
        }
    }

    protected function resolveInclude(string $suiteId, string $actionsId): array
    {
        if (!isset($this->config['suites'][$suiteId]['screenshots'][$actionsId])) {
            throw new ConfigurationException(sprintf(
                'Cannot include actions of ID "%s".', $actionsId
            ));
        }

        $actions = $this->config['suites'][$suiteId]['screenshots'][$actionsId];

        foreach ($actions as $position => &$action) {
            if (isset($action['include']) && count($action) === 1) {
                $includeActions = $this->resolveInclude($suiteId, $action['include']);
                array_splice($actions, $position, 1, $includeActions);
            }
        }

        return $actions;
    }

    protected function removeNotExecutableActionsIds(array &$config): void
    {
        if (!empty($config['suites'])) {
            foreach ($config['suites'] as $suiteId => &$suite) {
                if (isset($suite['screenshots'])) {
                    foreach ($suite['screenshots'] as $actionsId => &$actions) {
                        if (!$this->isExecutableActionsId($actionsId)) {
                            unset($suite['screenshots'][$actionsId]);
                        }
                    }
                }
            }
        }
    }

    protected function isExecutableActionsId($actionsId): bool
    {
        return is_numeric($actionsId) || substr($actionsId, 0, 1) !== '_';
    }

    public function write(): void
    {
        GeneralUtility::mkdir_deep($this->path);
        GeneralUtility::writeFile($this->getFilePath(), $this->printAsJson());
        $this->refresh();
    }

    public function getSelectableActionsIds(): array
    {
        $actionIds = [];

        if (!empty($this->config['suites'])) {
            foreach ($this->config['suites'] as &$suite) {
                if (isset($suite['screenshots'])) {
                    foreach ($suite['screenshots'] as $actionsId => &$actions) {
                        if ($this->isSelectableActionsId($actionsId)) {
                            $actionIds[] = $actionsId;
                        }
                    }
                }
            }
        }

        return $actionIds;
    }

    protected function isSelectableActionsId($actionsId): bool
    {
        return !is_numeric($actionsId) && substr($actionsId, 0, 1) !== '_';
    }

    /**
     * Print the configuration frame pretty and use normal printing for the actions so that they consume only one line
     * each.
     *
     * @return string
     */
    protected function printAsJson(): string
    {
        return JsonHelper::printJson($this->config, 5);
    }

    public function isExisting(): bool
    {
        return $this->existing;
    }

    public function getPath(): string
    {
        return $this->path;
    }

    public function getConfig(): array
    {
        return $this->config;
    }

    public function getConfigPrepared(): array
    {
        return $this->configPrepared;
    }

    public function createBasicConfig(): void
    {
        $this->setConfig([
            'suites' => [
                'Core' => [
                    'screenshots' => [
                        [
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'see', 'text' => "List"],
                            ['action' => 'click', 'link' => "List"],
                            ['action' => 'waitForText', 'text' => "New TYPO3 site"],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "Typo3ListWindow"],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "Typo3ListFullPage"],
                            ['action' => 'makeScreenshotOfElement', 'selector' => "#typo3-contentIframe", 'fileName' => "Typo3ListContentFrameOnly"],
                            ['action' => 'makeScreenshotOfElement', 'selector' => ".topbar-header-site", 'fileName' => "Typo3ListElementOnly"],
                        ]
                    ]
                ],
                'Examples' => [
                    'screenshots' => [
                        [
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'see', 'text' => "List"],
                            ['action' => 'click', 'link' => "List"],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "ExamplesDashboardFullPage"],
                        ]
                    ]
                ],
                'Install' => [
                    'screenshots' => [
                        [
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 1200],
                            ['action' => 'deleteFileInTypo3PublicPath', 'filePath' => 'FIRST_INSTALL'],
                            ['action' => 'reloadInstallationProcess'],
                            ['action' => 'makeScreenshotOfElement', 'selector' => ".typo3-install-content", 'fileName' => "InstallationStep0"],
                            ['action' => 'writeFileToTypo3PublicPath', 'filePath' => 'FIRST_INSTALL'],
                            ['action' => 'reloadInstallationProcess'],
                            ['action' => 'makeScreenshotOfElement', 'selector' => ".typo3-install-content", 'fileName' => "InstallationStep1"],
                            ['action' => 'click', 'link' => ".btn-success"],
                            ['action' => 'waitForText', 'text' => "Select database"],
                            ['action' => 'fillField', 'field' => 'install[values][username]', 'value' => 'root'],
                            ['action' => 'fillField', 'field' => 'install[values][password]', 'value' => 'root'],
                            ['action' => 'fillField', 'field' => 'install[values][host]', 'value' => 'db'],
                            ['action' => 'makeScreenshotOfElement', 'selector' => ".typo3-install-content", 'fileName' => "InstallationStep2"],
                            ['action' => 'click', 'link' => ".btn-success"],
                            ['action' => 'waitForText', 'text' => "Select a database"],
                            ['action' => 'fillField', 'field' => 'install[values][new]', 'value' => 'screenshots_install'],
                            ['action' => 'makeScreenshotOfElement', 'selector' => ".typo3-install-content", 'fileName' => "InstallationStep3"],
                            ['action' => 'click', 'link' => ".btn-success"],
                            ['action' => 'waitForText', 'text' => "Create Administrative User"],
                            ['action' => 'fillField', 'field' => 'install[values][username]', 'value' => 'admin'],
                            ['action' => 'fillField', 'field' => 'install[values][password]', 'value' => '12345678'],
                            ['action' => 'fillField', 'field' => 'install[values][email]', 'value' => 'admin@my.org'],
                            ['action' => 'fillField', 'field' => 'install[values][sitename]', 'value' => 'My website'],
                            ['action' => 'makeScreenshotOfElement', 'selector' => ".typo3-install-content", 'fileName' => "InstallationStep4"],
                            ['action' => 'click', 'link' => ".btn-success"],
                            ['action' => 'waitForText', 'text' => "Installation Complete"],
                            ['action' => 'makeScreenshotOfElement', 'selector' => ".typo3-install-content", 'fileName' => "InstallationStep5"],
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
                            ['action' => 'reloadBackend', 'role' => 'simple-editor'],
                            ['action' => 'waitForText', 'text' => 'simple-editor', 'timeout' => 5],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "IntroductionSimpleEditorSwitch"],
                            ['action' => 'reloadBackend', 'role' => 'advanced-editor'],
                            ['action' => 'waitForText', 'text' => 'advanced-editor', 'timeout' => 5],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "IntroductionAdvancedEditorSwitch"],
                            ['action' => 'reloadBackend', 'role' => 'admin'],
                            ['action' => 'waitForText', 'text' => 'Klaus Admin', 'timeout' => 5],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "IntroductionAdminSwitch"],
                        ]
                    ]
                ],
                'Styleguide' => [
                    'screenshots' => [
                        '_default' => [
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                        ],
                        'actionsIdentifierScreenshots' => [
                            ['comment' => '********************************************************'],
                            ['comment' => 'Take screenshots configured in a dummy screenshots.json.'],
                            ['comment' => '********************************************************'],
                            ['include' => '_default'],
                            ['action' => 'setScreenshotsDocumentationPath', 'path' => "StyleguideDocumentation"],
                            ['action' => 'setScreenshotsImagePath', 'path' => "Images/StyleguideScreenshots"],
                            ['action' => 'see', 'text' => "List"],
                            ['action' => 'click', 'link' => "List"],
                            ['action' => 'openPageTreePath', 'path' => ["styleguide TCA demo", "elements rte"]],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'waitForText', 'text' => 'elements rte', 'timeout' => 5],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideList"],
                            ['action' => 'resizeToFullPage'],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "StyleguidePartiallyScrolledOutElement", 'selector' => "#t3-table-tx_styleguide_elements_rte"],
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "StyleguideListFullPage"],
                            ['action' => 'scrollModuleBodyTo', 'toSelector' => '#clipboard_form'],
                            ['action' => 'scrollModuleBodyToBottom'],
                            ['action' => 'switchToMainFrame'],
                            ['action' => 'scrollModuleMenuTo', 'toSelector' => '#system_config'],
                            ['action' => 'scrollModuleMenuToBottom'],
                            ['action' => 'scrollPageTreeToBottom'],
                            ['action' => 'scrollPageTreeTo', 'toSelector' => '#identifier-0_152'],
                            ['action' => 'scrollPageTreeToBottom'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideListScrolledDown"],
                            ['action' => 'scrollModuleMenuTo', 'toSelector' => '#web_list'],
                            ['action' => 'scrollPageTreeToTop'],
                            ['action' => 'scrollPageTreeTo', 'toSelector' => '#identifier-0_12'],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'scrollModuleBodyTo', 'toSelector' => '#t3-table-pages_translated'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideListScrolledToElement", "captionText" => "A caption text not linked"],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "StyleguideTcaTable", 'selector' => "#t3-table-pages_translated", "altText" => "This is a TCA table", "captionText" => "A caption text linked to my-reference", "captionReference" => "my-reference"],
                            ['action' => 'createScreenshotsRstFile', 'create' => false],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "StyleguideTcaTableWithoutRst", 'selector' => "#t3-table-pages_translated"],
                            ['action' => 'click', 'link' => "#dropdownShortcutMenu"],
                            ['action' => 'click', 'link' => "Create a bookmark to this page"],
                            ['action' => 'waitForModalDialogInMainFrame'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideAddToFavoritesModal"],
                            ['action' => 'clickButtonInModalDialog', 'buttonLink' => "OK"],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideAddToFavoritesModalConfirmed"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'click', 'link' => "elements rte - language 4"],
                            ['action' => 'waitForText', 'text' => 'Edit Page "elements rte - language 4"', 'timeout' => 5],
                            ['action' => 'click', 'link' => "select[name*=doktype]"],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguidePageSelectboxOpen"],
                            ['action' => 'switchToMainFrame'],
                            ['action' => 'see', 'text' => "Maintenance"],
                            ['action' => 'click', 'link' => "Maintenance"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'fillField', 'field' => 'input#confirmationPassword', 'value' => 'password'],
                            ['action' => 'click', 'link' => 'Confirm'],
                            ['action' => 'waitForText', 'text' => 'Maintenance', 'timeout' => 5],
                            ['action' => 'click', 'link' => 'Manage languages'],
                            ['action' => 'waitForModalDialogInMainFrame'],
                            ['action' => 'scrollModalDialogTo', 'toSelector' => '.t3js-languagePacks-mainContent'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "ModalDialogScrolledToElement"],
                            ['action' => 'resizeWindow', 'width' => 480, 'height' => 768],
                            ['action' => 'reloadBackend'],
                            ['action' => 'click', 'link' => '.topbar-button-modulemenu'],
                            ['action' => 'wait', 'timeout' => 0.3],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideMobile"],
                            ['action' => 'makeScreenshotOfFullPage', 'fileName' => "StyleguideMobileFullPage"],
                            ['action' => 'click', 'link' => '.topbar-button-modulemenu'],
                            ['action' => 'resizeWindow', 'width' => 1024, 'height' => 768],
                            ['action' => 'see', 'text' => "Filelist"],
                            ['action' => 'click', 'link' => "Filelist"],
                            ['action' => 'openFileTreePath', 'path' => ["fileadmin", "styleguide"]],
                            ['action' => 'scrollFileTreeToTop'],
                            ['action' => 'scrollFileTreeToBottom'],
                            ['action' => 'scrollFileTreeTo', 'toSelector' => '#identifier-1_107375831'],
                            ['action' => 'wait', 'timeout' => 1],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideFilelist"],
                        ],
                        'actionsIdentifierScreenshotsOfContentFrameOnly' => [
                            ['include' => '_default'],
                            ['action' => 'setNavigationDefaultPid', 'pid' => 22],
                            ['action' => 'setNavigationDefaultTable', 'table' => 'tx_styleguide_elements_basic'],
                            ['action' => 'setNavigationDefaultUid', 'uid' => 1],
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
                            ['action' => 'clearNavigationDefaults'],
                            ['action' => 'reloadBackend'],
                        ],
                        'actionsIdentifierCodeSnippets' => [
                            ['action' => 'setCodeSnippetsTargetPath', 'path' => "CodeSnippets/StyleguideCode"],
                            ['action' => 'createCodeSnippet', 'sourceFile' => 'typo3/sysext/core/Configuration/TCA/be_groups.php', 'targetFileName' => 'BeGroups'],
                            [
                                'action' => 'createCodeSnippet',
                                'sourceFile' => 'typo3/sysext/core/Configuration/TCA/be_groups.php',
                                'targetFileName' => 'BeGroupsWithHighlights',
                                'caption' => 'I am the caption',
                                'name' => 'i-am-the-target-name',
                                'showLineNumbers' => true,
                                'lineStartNumber' => 3,
                                'emphasizeLines' => [5, 6, 7],
                            ],
                            ['action' => 'setCodeSnippetsSourcePath', 'path' => "typo3/sysext/core"],
                            ['action' => 'createCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'targetFileName' => 'BeGroupsWithPresetSourcePath'],
                            ['action' => 'createJsonCodeSnippet', 'sourceFile' => 'composer.json', 'targetFileName' => 'CoreComposerJson'],
                            ['action' => 'createJsonCodeSnippet', 'sourceFile' => 'composer.json', 'fields' => ["name", "support/source"], 'inlineLevel' => 1, 'targetFileName' => 'CoreComposerJsonDescription'],
                            ['action' => 'createPhpArrayCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'targetFileName' => 'TcaBeGroups'],
                            ['action' => 'createPhpArrayCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'fields' => ['columns/title'], 'targetFileName' => 'TcaBeGroupsColumnsTitle'],
                            ['action' => 'createPhpClassCodeSnippet', 'class' => 'TYPO3\CMS\Core\Cache\Backend\FileBackend', 'members' => ['setCache', 'frozen', 'freeze'], 'targetFileName' => 'FileBackendFreeze'],
                            ['action' => 'createPhpClassCodeSnippet', 'class' => 'TYPO3\CMS\Core\Cache\Backend\FileBackend', 'members' => ['setCache', 'frozen', 'freeze'], 'withComment' => true, 'targetFileName' => 'FileBackendFreezeWithComments'],
                            ['action' => 'setCodeSnippetsSourcePath', 'path' => ""],
                            ['action' => 'createXmlCodeSnippet', 'sourceFile' => 'typo3/sysext/form/Configuration/FlexForms/FormFramework.xml', 'targetFileName' => 'FormFrameworkXml'],
                            ['action' => 'createXmlCodeSnippet', 'sourceFile' => 'typo3/sysext/form/Configuration/FlexForms/FormFramework.xml', 'nodes' => ['T3DataStructure/sheets/sDEF/ROOT/TCEforms/sheetTitle'], 'targetFileName' => 'FormFrameworkXmlSheetTitle'],
                            ['action' => 'createYamlCodeSnippet', 'sourceFile' => 'typo3/sysext/core/Configuration/Services.yaml', 'targetFileName' => 'CoreServicesYaml'],
                            ['action' => 'createYamlCodeSnippet', 'sourceFile' => 'typo3/sysext/core/Configuration/Services.yaml', 'fields' => ['services/_defaults'], 'inlineLevel' => 2, 'targetFileName' => 'CoreServicesYamlDefaults'],
                        ],
                        'actionsIdentifierDraw' => [
                            ['include' => '_default'],
                            ['action' => 'switchToMainFrame'],
                            ['action' => 'see', 'text' => "Dashboard"],
                            ['action' => 'click', 'link' => "Dashboard"],
                            ['action' => 'drawBox', 'selector' => '#dashboard'],
                            ['action' => 'drawArrow', 'selector' => '#dashboard', 'position' => 'right-bottom'],
                            ['action' => 'drawBadge', 'selector' => '#dashboard', 'label' => 'Click here', 'position' => 'bottom'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideDashboardWithHighlightedMenuitem"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'scrollModuleBodyTo', 'toSelector' => '(//*[contains(@class, "dashboard-item-content")])[2]'],
                            ['action' => 'drawBox', 'selector' => '(//*[contains(@class, "dashboard-item-content")])[2]'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideDashboardWithHighlightedDashboardItem"],
                            ['action' => 'clearDrawings'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "StyleguideDashboardWithClearedHighlights"],
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
        ]);
    }
}
