<?php

declare(strict_types=1);
namespace TYPO3\CMS\Screenshots\ViewHelpers;

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
