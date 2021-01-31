<?php

include 'header.php';
include 'include.php';

$comment = '// Automatic screenshot: Remove this comment if you wand to manually change this file';

$publicPath = '../';
$styleguidePath = 'typo3conf/ext/styleguide/Configuration/TCA/';

$files = [
    'tx_styleguide_elements_basic.php',
    'tx_styleguide_elements_group.php',
    'tx_styleguide_elements_select.php',
    'tx_styleguide_elements_rte.php',
    'tx_styleguide_elements_t3editor.php',
    'tx_styleguide_flex.php',
    'tx_styleguide_inline_1n.php',
    'tx_styleguide_inline_1n1n.php',
    'tx_styleguide_inline_usecombination.php',
    'tx_styleguide_inline_mnsymmetric.php',
    'tx_styleguide_inline_mnsymmetric_mm.php',
    'tx_styleguide_inline_mn.php',
    'tx_styleguide_inline_mn_child.php',
    'tx_styleguide_inline_mn_mm.php',
];

$outputPath = $publicPath.'/Output/TYPO3CMS-Reference-TCA/Documentation/Examples/Snippets/Styleguide/Sources/';

if (!is_dir($outputPath)) {
    if (!mkdir($outputPath, 0777, true) && !is_dir($outputPath)) {
        throw new \RuntimeException(sprintf('Directory "%s" was not created', $outputPath));
    }
}


foreach ($files as $fileName) {
    $file = $publicPath.$styleguidePath.$fileName;
    $tca = include ($file);
    $lines = ['<?php '.$comment, '', 'return ['];
    $table = explode('.', $fileName);
    $table = $table[0];
    parseTca($tca, '   ', $lines, [], '// Example from extension "styleguide", table "' . $table . '"');
    $lines[] = '];';
    echo 'output: ' . $fileName . "<br>";
    file_put_contents ($outputPath.$fileName , implode("\n", $lines));
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