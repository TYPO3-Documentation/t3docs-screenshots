<?php

include 'header.php';
include 'include.php';


$added = 0;
$writeProtected = 0;
$changed = 0;
$diffFiles = [];

foreach($copyPath as $copy) {
    $originalFiles = scandir($copy['to']);
    $outputFiles = scandir($copy['from']);
    echo 'copy from '.$copy['from'].': '.count($outputFiles).'<br>';
    foreach ($outputFiles as $file) {
        $type = getFileType($file);
        if ($type === 'rst' || $type === 'rst.txt' || $type === 'php') {
            $diffFiles[$copy['from'] . $file] = [
                'pathFrom' => $copy['from'],
                'pathTo' => $copy['to'],
                'file' => $file,
                'type' => $type,
                'status' => 'added'
            ];
            $added++;
        }
    }
    foreach ($originalFiles as $file) {
        $out = $copy['from'].$file;
        if (isset($diffFiles[$out])){
            $changed ++;
            $added--;
            $diffFiles[$out]['status'] = 'changed';
            $f = fopen($copy['to'].$file, 'r');
            $line = fgets($f);
            $diffFiles[$out]['line'] = $line;
            fclose($f);
            $diffFiles[$out]['orgFirstLine'] = $line;
            if (isFilesEqual($copy['from'].$file, $copy['to'].$file)) {
                $changed --;
                $diffFiles[$out]['status'] = 'equal';
            } else {
                if (($type === 'rst' || $type === 'rst.txt') &&
                    strpos($line, '.. Automatic screenshot: ') === false) {
                    $diffFiles[$out]['status'] = 'writeProtected';
                    $writeProtected++;
                    $changed--;
                }
                if (($type === 'php') &&
                    strpos($line, ' Automatic screenshot: ') === false) {
                    $diffFiles[$out]['status'] = 'writeProtected';
                    $writeProtected++;
                    $changed--;
                }
            }
        }

    }
}


echo 'added: '.$added.' <br>';
echo 'changed: '.$changed.' <br>';
echo 'writeProtected: '.$writeProtected.' <br>';

echo '
<form action="copyRst.php" method="post">
    <input type="submit" value="Copy checked images" />
';

echo '<div class="accordion" id="accordionExample">';

if ($added > 0) {
    $title = 'Added files: ' . $added;
    $content = '
        <button class="btn btn-secondary" value="" id="checkAdd">
            Check all to be added
        </button>
        <button class="btn btn-secondary" value="" id="unCheckAdd">
            Uncheck all to be added
        </button>';

    $i = 0;
    foreach ($diffFiles as $diff) {
        $i ++;
        if ($diff['status'] === 'added') {
            $value = 'add|'.$diff['file'].'|'.$diff['pathFrom'].'|'.$diff['pathTo'];
            $id = 'add-'.$i;
            $content .= makeCheckbox($id, $value, $diff['file'], 'addedCheckbox', true);

        }
    }
    echo makeAccordion($title, $content, 'added', '#accordionExample');
}



if ($changed > 0) {
    $title = 'Changed files: ' . $changed;
    $content = '
        <button class="btn btn-secondary" value="" id="checkChanged">
            Check all changed
        </button>
        <button class="btn btn-secondary" value="" id="unCheckChanged">
            Uncheck all changed
        </button>';

    $i = 0;
    foreach ($diffFiles as $diff) {
        $i ++;
        if ($diff['status'] === 'changed') {
            $value = 'move|' . $diff['file'] . '|' . $diff['pathFrom'] . '|' . $diff['pathTo'];
            $id = 'move-' . $i;
            $content .= makeCheckbox($id, $value, $diff['file'],
                'changedCheckbox', true);
        }
    }
    echo makeAccordion($title, $content, 'changed', '#accordionExample');
}

if ($writeProtected > 0) {
    $title = 'Write protected files: ' . $writeProtected;
    $content = '
        <button class="btn btn-secondary" value="" id="checkWriteProtected">
            Check all write protected
        </button>
        <button class="btn btn-secondary" value="" id="unCheckWriteProtected">
            Uncheck all write protected
        </button>';

    $i = 0;
    foreach ($diffFiles as $diff) {
        $i ++;
        if ($diff['status'] === 'writeProtected') {
            $value = 'move|' . $diff['file'] . '|' . $diff['pathFrom'] . '|' . $diff['pathTo'];
            $id = 'move-' . $i;
            $content .= makeCheckbox($id, $value, $diff['file'],
                'protectedCheckbox', false,
                '<br> First line: ' . $diff['line']);
        }
    }
    echo makeAccordion($title, $content, 'changed', '#accordionExample');
}

echo '
    <input type="submit" value="Copy checked images" />
</form>
<script>
    $("#checkAdd").click(function(e) {
        e.preventDefault();
        $(".addedCheckbox").prop("checked", true);
    });
    $("#unCheckAdd").click(function(e) {
        e.preventDefault();
        $(".addedCheckbox").prop("checked", false);
    });
    $("#checkWriteProtected").click(function(e) {
        e.preventDefault();
        $(".protectedCheckbox").prop("checked", true);
    });
    $("#unCheckWriteProtected").click(function(e) {
        e.preventDefault();
        $(".protectedCheckbox").prop("checked", false);
    });
    $("#checkWriteChanged").click(function(e) {
        e.preventDefault();
        $(".changedCheckbox").prop("checked", true);
    });
    $("#unCheckChanged").click(function(e) {
        e.preventDefault();
        $(".changedCheckbox").prop("checked", false);
    });
</script>
';



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

echo '<p><a href="index.php" class="btn btn-primary">Back to index</a></p>';
include 'footer.php';