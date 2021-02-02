<?php

include 'header.php';
include 'include.php';
$threshold = 0.0002;

$copyPaths = [];

foreach ($config['extensions'] as $key => $extensionConfig) {
    $diffPath = $extensionConfig['diffPath'];
    $originalPath = $extensionConfig['originalPath'];
    $outputPath = $extensionConfig['outputPath'];
    if (is_dir($originalPath)) {
        createDirIfNotExists($diffPath);
        createDirIfNotExists($outputPath);
        $copyPaths[] = [
            'from' => $outputPath,
            'to' => $originalPath,
            'diff' => $diffPath
        ];
    }
}

$fileTypes = compareFiles($copyPaths, ['png']);
$fileTypes = compareChangedImages($fileTypes, $threshold);


echo '
<form action="copy.php" method="post">
    <input type="submit" value="Copy checked images" />
';

echo displayImageAccordion($fileTypes['changed'], 'changed', 'move');
echo displayImageAccordion($fileTypes['added'], 'added', 'add');
echo displayImageAccordion($fileTypes['deleted'], 'deleted', 'delete');
echo '
    <input type="submit" value="Copy checked images" />
</form>
<p><a href="index.php" class="btn btn-primary">Back to index</a></p>';
include 'footer.php';

function compareChangedImages($fileTypes, $threshold) {
    $changed = [];

    foreach ($fileTypes['changed'] as &$diff) {
        $image1 = new imagick($diff['to'] . $diff['file']);
        $image2 = new imagick($diff['from'] . $diff['file']);
        $diffImage = $image1->compareImages($image2, Imagick::METRIC_MEANABSOLUTEERROR);
        $diff['difference'] = $diffImage[1];
        if ($diffImage[1] > $threshold) {
            $diff['difference'] = $diffImage[1];
            file_put_contents($diff['diff'] . $diff['file'], $diffImage[0]);
            $changed[] = $diff;
        }
    }
    unset($diff);
    $fileTypes['changed'] = $changed;
    return $fileTypes;
}

function displayImageAccordion(array $changed, string $action, string $fileAction)
{
    $ret = '';
    if (count($changed) > 0) {
        $content = '';
        $i = 0;
        foreach ($changed as $diff) {
            $i++;
            $value = $fileAction. '|' . $diff['file'] . '|' . $diff['from'] . '|' .
                $diff['to'];
            $checked = true;
            switch ($action) {
                case 'changed' :
                    $title = 'Changed files (' . count($changed) . ')';
                    $imgHeader = 'Override ' . $diff['file'] . ' Difference: ' .
                        number_format($diff['difference'] * 100, 5);
                    $label = 'Override '. $diff['file'];
                    break;
                case 'added':
                    $title = 'Added files (' . count($changed) . ')';
                    $imgHeader = 'Add ' . $diff['file'];
                    $label = $imgHeader;
                    break;
                case 'deleted':
                    $title = 'Deleted files (' . count($changed) . ')';
                    var_dump($diff);
                    $imgHeader = 'Delete ' . $diff['file'];
                    $checked = false;
                    $label = $imgHeader;
                    break;

            }
            $contentInner = '';
            $contentInner .= makeCheckbox($action . '-' . $i, $value, $label,
                $action, $checked);
            $contentInner .= '<br>';
            switch ($action) {
                case 'changed' :
                    $contentInner .= displayImage($diff['file'], $diff['diff'], 'Difference');
                    $contentInner .= displayImage($diff['file'], $diff['to'], 'Original Image');
                    $contentInner .= displayImage($diff['file'], $diff['from'], 'New Image');
                    break;
                case 'added':
                    $contentInner .= displayImage($diff['file'], $diff['from'], 'Image to be added');
                    break;
                case 'deleted':
                    $contentInner .= displayImage($diff['file'], $diff['to'], 'Image to be deleted');
                    break;

            }
            $content .=  makeAccordion($imgHeader, $contentInner, 'changed-tab-' . $i, '');
        }
        $ret .= makeAccordion($title, $content, $action, '', 'my-2');
    }
    return $ret;
}

function displayImage($filename, $path='', $label=''): string {
    $ret = '';
    if ($label) {
        $ret .= '<h5>' . $label . '</h5>';
    }
    $ret .= '<div><img src="' . $path . $filename . '" /></div>';
    return $ret;
}