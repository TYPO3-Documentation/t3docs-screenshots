<?php
$publicPath = '../';
$manualPath = 'TYPO3CMS-Reference-TCA';
if (isset($_GET['manual'])) {
    $manualPath = $_GET['manual'];
    setcookie ( 'manual' , $_GET['manual'] , time()+60*60*24*30);
} else if (isset($_COOKIE['manual'])) {
    $manualPath = $_COOKIE['manual'];
}
$manualPath .= '/';
$jsonConfig = file_get_contents($publicPath.'OriginalManual/'.$manualPath.'Scripts/GenerateScreenshots/Config.json');
$config = json_decode($jsonConfig, true);

foreach ($config['extensions'] as $key => $value) {

    if(isset($config['extensions'][$key]['tables'])) {
        foreach ($config['extensions'][$key]['tables'] as $key2 => $value2) {
            $config['extensions'][$key]['tables'][$key2]['tableConvert'] =
                $config['extensions'][$key]['tables'][$key2]['tableConvert'] ?? '';
        }
        unset($tableConfig);
    }


    $config['extensions'][$key]['imageSource'] = $manualPath . $config['extensions'][$key]['paths']['imageSource'];
    $config['extensions'][$key]['imageRst'] = $manualPath . $config['extensions'][$key]['paths']['imageRst'];

    if (isset($config['extensions'][$key]['paths']['source'])) {
        $config['extensions'][$key]['sourcePath'] = $config['extensions'][$key]['paths']['source'];
        $config['extensions'][$key]['codeSource'] = $manualPath . $config['extensions'][$key]['paths']['codeSource'];
        $config['extensions'][$key]['codeRst'] = $manualPath . $config['extensions'][$key]['paths']['codeRst'];
        $config['extensions'][$key]['outputSourcePath'] = $publicPath . 'Output/' . $config['extensions'][$key]['codeSource'];
    }

    $config['extensions'][$key]['originalPath'] = $publicPath . 'OriginalManual/' . $config['extensions'][$key]['imageSource'];
    $config['extensions'][$key]['outputPath'] = $publicPath . 'Output/' . $config['extensions'][$key]['imageSource'];
    $config['extensions'][$key]['diffPath'] = $publicPath . 'Output/Diff/' . $manualPath . $config['extensions'][$key]['imageSource'];

    $config['extensions'][$key]['copyPath'] = [
        [
            'from' => $publicPath.'Output/'.$config['extensions'][$key]['imageRst'],
            'to' => $publicPath.'OriginalManual/'.$config['extensions'][$key]['imageRst'],
        ],
    ];

    if (isset($config['extensions'][$key]['paths']['source'])) {
        $config['extensions'][$key]['copyPath'][] = [
            'from' => $publicPath.'Output/'.$config['extensions'][$key]['codeRst'],
            'to' => $publicPath.'OriginalManual/'.$config['extensions'][$key]['codeRst'],
        ];
        $config['extensions'][$key]['copyPath'][] = [
            'from' => $publicPath.'Output/'. $config['extensions'][$key]['codeSource'],
            'to' => $publicPath.'OriginalManual/'. $config['extensions'][$key]['codeSource'],
        ];
    }
    if (isset($config['extensions'][$key]['sourceFiles'])) {
        foreach ($config['extensions'][$key]['sourceFiles'] as $sourceConfig) {
            $config['extensions'][$key]['copyPath'][] = [
                'from' => getOutputPath($sourceConfig['paths']['codeSource']),
                'to' => getManualPath($sourceConfig['paths']['codeSource']),
            ];
        }
    }
}

function getOutputPath($path) {
    return $GLOBALS['publicPath'] . 'Output/' . $GLOBALS['manualPath'] . $path;
}
function getManualPath($path) {
    return $GLOBALS['publicPath'] . 'OriginalManual/' . $GLOBALS['manualPath'] . $path;
}

function isFilesEqual($file1, $file2): bool
{
    return (filesize($file1) === filesize($file2)
        && md5_file($file1) === md5_file($file2)
    );
}


/**
 * @param $file
 * @return string
 */
function getFileType($file): string
{
    $type = '';
    $split = explode('.', $file, 2);
    return strtolower($split[1]);
}

function makeAccordion($title, $content, $id, $parent, $class='my-5') {
    return '
    <div class="card '.$class.'">
        <div class="card-header" id="heading'.$id.'">
            <h2 class="mb-0">
                <button class="btn btn-link" type="button" data-toggle="collapse"
                        data-target="#collapse'.$id.'"
                        aria-expanded="false" aria-controls="collapse'.$id.'">
                    '.$title.'
                </button>
            </h2>
        </div>

        <div id="collapse'.$id.'" class="collapse " aria-labelledby="heading'.$id.'" data-parent="'.$parent.'">
            <div class="card-body">
                '.$content.'
            </div>
        </div>
    </div>
    ';
}

function makeCheckbox($id, $value, $label, $class, $isChecked = false, $content = '') {
    $checked = '';
    if ($isChecked) {
        $checked = 'checked="checked"';
    }
    return '
        <div>
            <input type="checkbox" '.$checked.' name="'.$id.'" class="'.$class.'"
                value="'.$value.'">
            <label for="'.$id.'">'.$label.'</label>
            '.$content.'
        </div>';
}



function copyFile ($file, $fromPath, $toPath) {
    copy ($fromPath.$file , $toPath.$file);
}


function deleteFile ($file, $fromPath) {
    unlink($fromPath.$file);
}


function createDirIfNotExists($dir) {
    /*
    echo linkinfo($dir);
    echo $dir.'<br>';
    if (is_link($dir)) {
        $dir = readlink($dir);
        echo 'links to: '.$dir.'<br>';
    }
    */
    if (!is_dir($dir)) {
        if (!mkdir( $dir, 0777, true) && !is_dir( $dir)) {
            throw new \RuntimeException(sprintf('Directory "%s" was not created',  $dir));
        }
    }
}

function compareFiles($copyPaths, $allowed) {
    $ret = [
        'added' => [],
        'changed' => [],
        'deleted' => [],
    ];
    $files = [];
    foreach ($copyPaths as $copy) {
        if (is_dir($copy['from'])) {
            createDirIfNotExists($copy['to']);
            if ($copy['diff']) {
                createDirIfNotExists($copy['diff']);
            }
            $originalFiles = scandir($copy['to']);
            $outputFiles = scandir($copy['from']);
            foreach ($outputFiles as $file) {
                $files = getFileData($files, $copy, $file, $allowed, 'added');
            }
            foreach ($originalFiles as $file) {
                $out = $copy['from'] . $file;
                if (isset($files[$out])) {
                    $files[$out]['status'] = 'changed';
                } else {
                    $files = getFileData($files, $copy, $file, $allowed, 'deleted');
                }

            }
        }
    }
    foreach ($files as $file) {
        $ret[$file['status']][] = $file;
    }
    return $ret;
}

/**
 * @param $copy
 * @param $file
 * @param string $type
 * @param array $files
 * @return array
 */
function getFileData(array $files, array $copy, string $file,  array $allowed, string $status): array
{
    $type = getFileType($file);
    if (in_array($type ,$allowed)) {
        $files[$copy['from'] . $file] = [
            'from' => $copy['from'],
            'to' => $copy['to'],
            'diff' => $copy['diff'],
            'file' => $file,
            'type' => $type,
            'status' => $status
        ];
    }
    return $files;
}
