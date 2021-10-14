<?php
/**
 * Nginx terminates SSL, so TYPO3 struggles with verifying the request port (443 <-> 80).
 * Allow any port by passing here the domain name without defining the port.
 */
$GLOBALS['TYPO3_CONF_VARS']['SYS']['trustedHostsPattern'] = 'core\.t3docs-screenshots\.ddev\.site';
