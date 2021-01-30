<?php

include 'include.php';

if (!is_dir($diffPath)) {
    if (!mkdir($diffPath, 0777, true) && !is_dir($diffPath)) {
        throw new \RuntimeException(sprintf('Directory "%s" was not created', $diffPath));
    }
}

$originalFiles = scandir($originalPath);
$outputFiles = scandir($outputPath);

$fileDiffs = [];

foreach ($originalFiles as $file) {
    $type = getFileType($file);
    if ($type) {
        $fileDiffs[$file] = [
            'original' => $file,
            'type' => $type,
        ];
    }
}

foreach ($outputFiles as $file) {
    $type = getFileType($file);
    if ($type) {
        if (isset($fileDiffs[$file])) {
            $fileDiffs[$file]['output'] = $file;
        } else {
            $fileDiffs[$file] = [
                'output' => $file,
                'type' => $type,
            ];
        }
    }
}

$deleted = 0;
$added = 0;
$changed = 0;
$unchanged = 0;

foreach ($fileDiffs as &$diff) {
    if (!isset($diff['original']) && !isset($diff['output'])){
        throw new \RuntimeException('One of original or output must be set');
    } else if (isset($diff['original']) && !isset($diff['output'])) {
        $diff['status'] = 'deleted';
        $deleted ++;
    } else if (!isset($diff['original']) && isset($diff['output'])) {
        $diff['status'] = 'added';
        $added ++;
    } else {
        $image1 = new imagick($originalPath.$diff['original']);
        $image2 = new imagick($outputPath.$diff['output']);
        $diffImage = $image1->compareImages($image2, Imagick::METRIC_MEANABSOLUTEERROR);
        $diff['difference'] =  $diffImage[1];
        if ($diffImage[1] == 0) {
            $unchanged++;
            $diff['status'] = 'unchanged';
        } else {
            $changed ++;
            $diff['status'] = 'changed';
            $diff['difference'] = $diffImage[1];
            file_put_contents ($diffPath.$diff['original'], $diffImage[0]);
        }
    }
}
unset($diff);

echo 'deleted: '.$deleted.' <br>';
echo 'added: '.$added.' <br>';
echo 'changed: '.$changed.' <br>';
echo 'unchanged: '.$unchanged.' <br>';

echo '
<form action="copy.php" method="post">
    <input type="submit" value="Copy checked images" />
';
if ($changed > 0) {
    echo '<h2>Changed files ('.$changed.')</h2>';
    $i = 0;
    foreach ($fileDiffs as $diff) {
        if ($diff['status'] === 'changed') {
            $i ++;
            $value = 'change|'.$diff['original'];
            echo '
<div>
    <input type="checkbox" checked="checked" name="change-'.$i.'" class="delete" 
        value="'.$value.'">
    <label for="delete|'.$i.'">
        '.$value.' Difference: 
        '.number_format ($diff['difference'] * 100,5).'
    </label> <br>
    Difference: <br>
    <img src="'.$diffPath.$diff['original'].'"><br>
    Original: <br>
    <img src="'.$originalPath.$diff['original'].'"><br>
    New: <br>
    <img src="'.$outputPath.$diff['output'].'"><br>
</div>';
        }
    }
}

if ($added > 0) {
    echo '<h2>Added files ('.$added.')</h2>';
    $i = 0;
    foreach ($fileDiffs as $diff) {
        $i ++;
        if ($diff['status'] === 'added') {
            $value = 'add|'.$diff['output'];
            echo '
<div>
    <input type="checkbox" checked="checked" name="add-'.$i.'" class="delete" 
        value="'.$value.'">
    <label for="delete-'.$i.'">'.$value.'</label> <br>
    <img src="'.$outputPath.$diff['output'].'">
</div>';
        }
    }
}

if ($deleted > 0) {
    echo '<h2>Deleted files ('.$deleted.')</h2>';
    $i = 0;
    foreach ($fileDiffs as $diff) {
        if ($diff['status'] === 'deleted') {
            $i ++;
            $value = 'delete|'.$diff['original'];

            echo '
<div>
    <input type="checkbox" name="delete-'.$i.'" class="delete" 
        value="'.$value.'">
    <label for="delete-'.$i.'">'.$value.'</label> <br>
    <img src="'.$originalPath.$diff['original'].'"><br>
</div>';
        }
    }
}
echo '
    <input type="submit" value="Copy checked images" />
<form>';


$outputFilesText = scandir($outputPath);


/*
echo '<pre>';
var_dump($fileDiffs);
echo '</pre>';
**





/*

$image1 = new imagick("../OriginalManual/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/Styleguide/AutomaticScreenshots/Checkbox2.png");
$image2 = new imagick("../Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Images/Styleguide/AutomaticScreenshots/Checkbox3.png");

$result = $image1->compareImages($image2, Imagick::METRIC_MEANSQUAREERROR);
$result[0]->setImageFormat("png");

file_put_contents ("../Output/Diff/test_0.png", $result[0]);

header("Content-Type: image/png");
echo $result[0];

*/