<?php
include 'header.php';
include 'include.php';

$added = 0;
$copied = 0;
$deleted = 0;

foreach ($_POST as $action) {
    $splitAction = explode('|', $action);
    switch ($splitAction[0]) {
        case 'add':
            $added ++;
            copyFile ($splitAction[1], $splitAction[2], $splitAction[3]);
            break;
        case 'move':
            $copied ++;
            copyFile ($splitAction[1], $splitAction[2], $splitAction[3]);
            break;
        case 'delete':
            $deleted ++;
            deleteFile ($splitAction[1], $splitAction[3]);
            break;
    }
}

echo "
$added files added<br>
$copied files copied<br>
$deleted files deleted
";

echo '<p><a href="index.php" class="btn btn-primary">Back to index</a></p>';
include 'footer.php';