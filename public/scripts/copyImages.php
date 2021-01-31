<?php


include 'header.php';
include 'include.php';

foreach ($_POST as $action) {
    $splitAction = explode('|', $action);
    switch ($splitAction[0]) {
        case 'add':
        case 'change':
            copyFile ($splitAction[1], $outputPath, $originalPath);
            copyFile ($splitAction[1], $outputPath, $originalPath);
            break;
        case 'delete':
            deleteFile ($splitAction[1], $originalPath);
    }
    echo $splitAction[0].': '. $splitAction[1].'<br>';
}

echo '<p><a href="index.php" class="btn btn-primary">Back to index</a></p>';
include 'footer.php';