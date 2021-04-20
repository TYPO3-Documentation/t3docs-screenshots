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
                'Introduction' => [
                    'screenshots' => [
                        [
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "introduction_dashboard"],
                        ]
                    ]
                ],
                'Styleguide' => [
                    'screenshots' => [
                        'actionsIdentifierScreenshots' => [
                            ['action' => 'setScreenshotsDocumentationPath', 'path' => "StyleguideDocumentation"],
                            ['action' => 'setScreenshotsImagePath', 'path' => "Images/StyleguideScreenshots"],
                            ['action' => 'see', 'text' => "Page"],
                            ['action' => 'click', 'link' => "Page"],
                            ['action' => 'switchToContentFrame'],
                            ['action' => 'makeScreenshotOfWindow', 'fileName' => "stylesheet_page_module"],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "stylesheet_infobox", 'selector' => ".callout", "altText" => "Typical TYPO3 infobox", "refLabel" => "my-reference-label", "refTitle" => "My reference title"],
                            ['action' => 'createScreenshotsRstFile', 'create' => false],
                            ['action' => 'makeScreenshotOfElement', 'fileName' => "stylesheet_infobox_without_rst", 'selector' => ".callout", "altText" => "Typical TYPO3 infobox", "refLabel" => "my-reference-label", "refTitle" => "My reference title"],
                        ],
                        'actionsIdentifierCodeSnippets' => [
                            ['action' => 'setCodeSnippetsTargetPath', 'path' => "CodeSnippets/StyleguideCode"],
                            ['action' => 'createCodeSnippet', 'sourceFile' => 'typo3/sysext/core/Configuration/TCA/be_groups.php'],
                            ['action' => 'setCodeSnippetsSourcePath', 'path' => "typo3/sysext/core"],
                            ['action' => 'createCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'targetFile' => 'be_groups_with_preset_source_path.php'],
                            ['action' => 'createCodeSnippetsRstFile', 'create' => false],
                            ['action' => 'createCodeSnippet', 'sourceFile' => 'Configuration/TCA/be_groups.php', 'targetFile' => 'be_groups_without_rst.php'],
                        ]
                    ]
                ]
            ]
        ];
    }
}
