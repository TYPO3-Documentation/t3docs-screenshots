<?php

include 'header.php';
include 'include.php';

$comment = '// Automatic screenshot: Remove this comment if you wand to manually change this file';


$files = [];

foreach ($tables as $tableConfig) {
    $filename = $tableConfig['table'].'.php';
    $file =  $publicPath.$sourcePath.$filename;
    if ($tableConfig['tableConvert'] !== 'ignore') {
        if (file_exists($file)) {
            $files[] = $filename;
        } else {
            echo '<div class="alert alert-warning" role="alert">
              File ' . $filename . ' not found. Ignored
            </div>';
        }
    }
}

if (!is_dir($outputSourcePath)) {
    if (!mkdir($outputSourcePath, 0777, true) && !is_dir($outputSourcePath)) {
        throw new \RuntimeException(sprintf('Directory "%s" was not created', $outputSourcePath));
    }
}


foreach ($files as $fileName) {
    $file = $publicPath.$sourcePath.$fileName;
    $tca = include ($file);
    $lines = ['<?php '.$comment, '', 'return ['];
    $table = explode('.', $fileName);
    $table = $table[0];
    parseTca($tca, '   ', $lines, [], '// Example from extension "styleguide", table "' . $table . '"');
    $lines[] = '];';
    echo 'output: ' . $fileName . "<br>";
    file_put_contents ($outputSourcePath.$fileName , implode("\n", $lines));
}

function parseTca($array, $indentation, &$lines, $position, $comment) {
    foreach ($array as $key => $item) {
        if (is_array($item)) {
            if ($position === 'columns') {
                $lines[] = $indentation . '// [start ' . $key . ']';
            }
            $lines[] = $indentation . '\'' . $key . '\' => [ ';
            parseTca($item, $indentation . '   ', $lines, $key, $comment);
            $lines[] = $indentation . '],';

            if ($position === 'columns') {
                $lines[] = $indentation . $comment;
                $lines[] = $indentation . '// [end ' . $key . ']';
            }
        } else if (is_string($item)) {
            $item = str_replace("'", "\\'", $item);
            $lines[] = $indentation . '\'' . $key . '\' => \''.$item.'\',';
        } else if (is_numeric($item)) {
            $lines[] = $indentation . '\'' . $key . '\' => '.$item.',';
        } else if (is_bool($item)) {
            if ($item) {
                $lines[] = $indentation . '\'' . $key . '\' => true,';
            } else {
                $lines[] = $indentation . '\'' . $key . '\' => false,';
            }
        } else if ($item === null) {
            $lines[] = $indentation . '\'' . $key . '\' => null,';
        } else {
            $lines[] = $indentation . '\'' . $key . '\' => '.$item.',';
        }
    }
}

echo '<p><a href="index.php" class="btn btn-primary">Back to index</a></p>';

include 'footer.php';