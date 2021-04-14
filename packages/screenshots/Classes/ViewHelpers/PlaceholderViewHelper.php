<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\ViewHelpers;

/*
 * This file is part of the TYPO3 project.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

use TYPO3Fluid\Fluid\Core\Rendering\RenderingContextInterface;
use TYPO3Fluid\Fluid\Core\ViewHelper\AbstractViewHelper;

class PlaceholderViewHelper extends AbstractViewHelper
{
    protected $escapeOutput = false;

    public function initializeArguments()
    {
        $this->registerArgument('width', 'string', 'width of the placeholder including unit', true);
        $this->registerArgument('height', 'string', 'height of the placeholder including unit', true);
    }

    public static function renderStatic(
        array $arguments,
        \Closure $renderChildrenClosure,
        RenderingContextInterface $renderingContext
    ) {
        $width = $arguments['width'];
        $height = $arguments['height'];
        $content = (string) $renderChildrenClosure();

        $styles = [];
        $styles[] = 'width: ' . $width;
        $styles[] = 'height: ' . $height;

        return sprintf('<div style="%s" class="placeholder">%s</div>',
            implode(';', $styles), $content
        );
    }
}
