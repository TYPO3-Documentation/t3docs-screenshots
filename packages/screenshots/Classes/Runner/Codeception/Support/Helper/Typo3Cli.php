<?php

declare(strict_types=1);

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

namespace TYPO3\CMS\Screenshots\Runner\Codeception\Support\Helper;

use Codeception\Module;

/**
 * Helper to access TYPO3 CLI commands.
 */
class Typo3Cli extends Module
{
    protected array $mappings = [];

    public function getUidByField(string $table, string $field, $value, string $uidField = 'uid'): int
    {
        if (!$this->hasMappings($table, $field, $uidField)) {
            $this->loadMappings($table, $field, $uidField);
        }
        return $this->getMapping($table, $field, $uidField, $value);
    }

    protected function hasMappings(string $table, string $fromField, string $toField): bool
    {
        return isset($this->mappings[$table][$fromField][$toField]);
    }

    protected function loadMappings(string $table, string $fromField, string $toField): void
    {
        exec(sprintf('typo3/sysext/core/bin/typo3 screenshots:mappings --from=%s --to=%s %s 2>&1',
            $fromField, $toField, $table
        ), $output, $resultCode);

        if ($resultCode === 0) {
            $result = json_decode(implode('', $output), true);
            if ($result === NULL) {
                throw new \Exception(sprintf('JSON Error #%s: %s', json_last_error(), json_last_error_msg()), 4001);
            }
            $this->mappings[$table][$fromField][$toField] = $result;
        } else {
            throw new \Exception(sprintf('TYPO3 Cli Error #%s: %s', $resultCode, implode('', $output)), 4002);
        }
    }

    protected function getMapping(string $table, string $fromField, string $toField, $value): int
    {
        if (!isset($this->mappings[$table][$fromField][$toField][$value])) {
            throw new \Exception(sprintf('No mapping available from "%s=%s" to "%s" in table "%s".',
                $fromField, $value, $toField, $table
            ), 4003);
        }

        return $this->mappings[$table][$fromField][$toField][$value];
    }
}
