<?php

$files = [
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_elements_basic.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_elements_group.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_elements_select.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_elements_rte.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_elements_t3editor.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_flex.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_1n.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_1n1n.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_usecombination.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_mnsymmetric.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_mnsymmetric_mm.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_mn.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_mn_child.php',
    'public/typo3conf/ext/styleguide/Configuration/TCA/tx_styleguide_inline_mn_mm.php',
];


foreach ($files as $file) {
    $tca = include ($file);
    $lines = ['<?php', '', 'return ['];
    $output = explode('/', $file);
    $output = $output[count($output) - 1];
    $table = explode('.', $output);
    $table = $table[0];
    parseTca($tca, '   ', $lines, [], '// Example from extension "styleguide", table "' . $table . '"');
    $lines[] = '];';
    echo 'output: ' . $output;
    file_put_contents ( $output , implode("\n", $lines));
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