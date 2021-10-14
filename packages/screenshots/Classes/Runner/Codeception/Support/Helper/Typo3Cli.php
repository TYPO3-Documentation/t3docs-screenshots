<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Runner\Codeception\Support\Helper;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use Codeception\Module;
use TYPO3\Documentation\Screenshots\Util\JsonHelper;

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
        [$resultCode, $output] = $this->fetchMappings($table, $fromField, $toField);

        if ($resultCode !== 0) {
            throw new \Exception(
                sprintf('TYPO3 Cli Error #%s: %s', $resultCode, implode('', $output)),
                4001
            );
        }

        try {
            $result = JsonHelper::parseArrayFromJson(implode('', $output));
        } catch (\JsonException $e) {
            throw new \Exception(
                sprintf('JSON Error #%s: %s', $e->getCode(), $e->getMessage()),
                4002
            );
        }

        $this->mappings[$table][$fromField][$toField] = $result;
    }

    protected function fetchMappings(string $table, string $fromField, string $toField): array
    {
        exec(sprintf('../../../../../vendor/bin/typo3 screenshots:mappings --from=%s --to=%s %s 2>&1',
            $fromField, $toField, $table
        ), $output, $resultCode);

        return [$resultCode, $output];
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
