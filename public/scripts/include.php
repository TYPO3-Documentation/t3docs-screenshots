<?php
$publicPath = '../';
$manualPath = 'TYPO3CMS-Reference-TCA/';
$jsonConfig = file_get_contents($publicPath.'OriginalManual/'.$manualPath.'Scripts/GenerateScreenshots/Config.json');
$config = json_decode($jsonConfig, true);
/*
echo '<pre>';
var_dump($config['extensions']['styleguide']['paths']);
echo '</pre>';
*/
$tables = [];
foreach ($config['extensions']['styleguide']['tables'] as $tableConfig) {
    $tables[] = [
        'table' => $tableConfig['table'],
        'tableConvert' => isset($tableConfig['tableConvert'])?$tableConfig['tableConvert']:'',
    ];
}
//$tables = array_unique($tables);


$imageSource = $manualPath.$config['extensions']['styleguide']['paths']['imageSource'];
$imageRst = $manualPath.$config['extensions']['styleguide']['paths']['imageRst'];
$codeSource = $manualPath.$config['extensions']['styleguide']['paths']['codeSource'];
$codeRst = $manualPath.$config['extensions']['styleguide']['paths']['codeRst'];
$sourcePath = $config['extensions']['styleguide']['paths']['source'];

$outputSourcePath = $publicPath.'Output/'.$codeSource;

$originalPath = $publicPath.'OriginalManual/'.$imageSource;
$outputPath = $publicPath.'Output/'.$imageSource;
$diffPath = $publicPath.'Output/Diff/'.$manualPath.$imageSource;

$copyPath = [
    [
        'from' => $publicPath.'Output/'.$imageRst,
        'to' => $publicPath.'OriginalManual/'.$imageRst,
    ],
    [
        'from' => $publicPath.'Output/'.$codeRst,
        'to' => $publicPath.'OriginalManual/'.$codeRst,
    ],
    [
        'from' => $publicPath.'Output/'.$codeSource,
        'to' => $publicPath.'OriginalManual/'.$codeSource,
    ],
];

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

function makeAccordion($title, $content, $id, $parent) {
return '
<div class="card">
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