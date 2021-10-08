<?php

declare(strict_types=1);
namespace TYPO3\Documentation\Screenshots\Runner\Codeception\Styleguide;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3\Documentation\Screenshots\Runner\Codeception\AbstractBaseCest;
use TYPO3\Documentation\Screenshots\Runner\Codeception\Support\Photographer;

/**
 * Run all actions of TYPO3 environment "Styleguide"
 */
class StyleguideCest extends AbstractBaseCest
{
    /**
     * @param Photographer $I
     */
    public function makeScreenshots(Photographer $I): void
    {
        $I->reloadBackend('admin');
        parent::runSuite($I, 'Styleguide');
    }
}
