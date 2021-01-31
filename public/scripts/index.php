<?php

include 'header.php';
include 'include.php';
?>

    <h1>Prepare Project</h1>
    <p>see <a href="prepareProject.php"> Prepare project</a></p>

    <h2>Steps</h2>

    <p><a href="convertSources.php" class="btn btn-primary"> Convert sources</a></p>
    <p>Call in the console: <pre> ddev puppeteer puppeteer-TCA.js</pre></p>
    <p><a href="compareImages.php" class="btn btn-primary"> Compare and move images</a></p>
    <p><a href="compareRst.php" class="btn btn-primary"> Compare and move other files</a></p>
    <p>In the end test and commit your changes. Use git to compare non-binary files.</p>

<?php
include 'footer.php';