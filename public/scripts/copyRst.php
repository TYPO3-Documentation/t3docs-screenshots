<?php
include 'header.php';
include 'include.php';

foreach ($_POST as $action) {
    $added = 0;
    $copied = 0;
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
    }
}

echo "
$added files added<br>
$copied f
";

include 'footer.php';