<?php


include 'header.php';
include 'include.php';

foreach ($_POST as $action) {
    $splitAction = explode('|', $action);
    switch ($splitAction[0]) {
        case 'add':
            copyFile ($splitAction[1]);
            break;
        case 'change':
            copyFile ($splitAction[1]);
            break;
        case 'delete':
            deleteFile ($splitAction[1]);
    }
    echo $splitAction[0].': '. $splitAction[1].'<br>';
}

include 'footer.php';