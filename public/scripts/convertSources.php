<?php

include 'header.php';
include 'include.php';

$comment = '// Automatic screenshot: Remove this comment if you want to manually change this file';


$files = [];

//var_dump($config);

foreach ($config['extensions'] as $key => $extensionConfig) {
    if (isset($extensionConfig['sourceFiles'])) {
        foreach ($extensionConfig['sourceFiles'] as $sourceConfig) {
            $sourceConfig['outputSourcePath'] =
                getOutputPath($sourceConfig['paths']['codeSource']);
            createDirIfNotExists($sourceConfig['outputSourcePath']);
            foreach ($sourceConfig['copy'] as $copyConfig) {
                if (isset($copyConfig['to'])) {
                    $filename = $copyConfig['to'];
                } else {
                    $filename = $copyConfig['from'];
                }
                $file = $publicPath . $sourceConfig['paths']['source'] . $filename;
                if (file_exists($file)) {
                    $files[] = [
                        'filename' => $filename,
                        'filepath' => $file,
                        'sourceConfig' => $sourceConfig,
                        'copyConfig' => $copyConfig,
                    ];
                } else {
                    echo '<div class="alert alert-warning" role="alert">
                  File ' . $filename . ' not found. Ignored <br>
                  Path: ' . $file . '
                </div>';
                }
            }
        }
    }
    foreach ($extensionConfig['tables'] as $tableConfig) {
        $filename = $tableConfig['table'].'.php';
        $file =  $publicPath.$extensionConfig['sourcePath'].$filename;
        if ($tableConfig['tableConvert'] !== 'ignore') {
            if (file_exists($file)) {
                $files[] = [
                    'filename' => $filename,
                    'filepath' =>$file,
                    'tableConvert' => $tableConfig['tableConvert'],
                    ];
            } else {
                echo '<div class="alert alert-warning" role="alert">
                  File ' . $filename . ' not found. Ignored <br>
                  Path: '.$publicPath.$extensionConfig['sourcePath'].$filename.'
                </div>';
            }
        }
    }

    createDirIfNotExists($extensionConfig['outputSourcePath']);


    foreach ($files as $fileConfig) {
        $fileName = $fileConfig['filename'];
        $file = $fileConfig['filepath'];
        $fileTo = $extensionConfig['outputSourcePath'] . $fileName;
        if (isset($fileConfig['sourceConfig'])) {
            $sourceConfig = $fileConfig['sourceConfig'];
            $copyConfig = $fileConfig['copyConfig'];
            $lines = file($file, FILE_IGNORE_NEW_LINES);
            $fileTo = $sourceConfig['outputSourcePath'] . $fileName;
        } else {
            if ($fileConfig['tableConvert'] === 'parse-as-text') {
                $lines = file($file, FILE_IGNORE_NEW_LINES);
            } else {
                $tca = include($file);
                $lines = ['<?php ' . $comment, '', 'return ['];
                $table = explode('.', $fileName);
                $table = $table[0];
                $showComments = $fileConfig['tableConvert'] !== 'no-comments';
                $comment = '// Example from extension "styleguide", table "' . $table . '"';
                parseTca($tca, '   ', $lines, '', $comment, $showComments);
                $lines[] = '];';
            }
        }
        if ($lines) {
            echo 'output: ' . $fileTo . "<br>";
            echo 'path: ' . $file . "<br>";
            file_put_contents($fileTo, implode("\n", $lines));
        }
    }
}

function parseTca($array, $indentation, &$lines, $position, $comment, $showComments=true) {
    foreach ($array as $key => $item) {
        if (is_array($item)) {
            if ($showComments && ($position === '' || $position === 'columns')) {
                $lines[] = $indentation . '// [start ' . $key . ']';
            }
            $lines[] = $indentation . '\'' . $key . '\' => [ ';
            parseTca($item, $indentation . '   ', $lines, $key, $comment, $showComments);
            $lines[] = $indentation . '],';

            if ($showComments && $position === 'columns') {
                $lines[] = $indentation . $comment;
            }
            if ($showComments && ($position === '' || $position === 'columns')) {
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
