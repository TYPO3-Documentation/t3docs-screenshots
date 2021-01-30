<?php
$originalPath = '../OriginalManual/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/Styleguide/AutomaticScreenshots/';
$outputPath = '../Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/Styleguide/AutomaticScreenshots/';
$diffPath = '../Output/Diff/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/Styleguide/AutomaticScreenshots/';

$copyPath = [
    [
        'from' => '../Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/Styleguide/RstIncludes/',
        'to' => '../OriginalManual/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/Styleguide/RstIncludes/',
    ],
    [
        'from' => '../Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Snippets/Styleguide/RstIncludes/',
        'to' => '../OriginalManual/TYPO3CMS-Reference-TCA/Documentation/Examples/Snippets/Styleguide/RstIncludes/',
    ],
    [
        'from' => '../Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Snippets/Styleguide/RstIncludes/',
        'to' => '../OriginalManual/TYPO3CMS-Reference-TCA/Documentation/Examples/Snippets/Styleguide/RstIncludes/',
    ],
];


/**
 * @param $file
 * @return string
 */
function getFileType($file): string
{
    $type = '';
    $split = explode('.', $file, 2);
    switch (strtolower($split[1])) {
        case 'png':
            $type = 'png';
            break;
        case 'rst':
            $type = 'rst';
            break;
        case 'rst.txt':
            $type = 'rst.txt';
            break;
    }
    return $type;
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