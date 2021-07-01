<?php

/** XML-RPC API availability - do less than promised ;) 
    FALSE => user are not able to generate and set his/her API key.
    XML-RPC server do not check this config in order to answer or not a call.
 */

$tlCfg->api->enabled = TRUE;

/** testlink requires SMPT configuration
	
    config fake smtp server mailhog 
	- see docker mailhog/mailhog
*/

/**
 * @var string SMTP server name or IP address ("localhost" should work in the most cases)
 * Configure using custom_config.inc.php
 * @uses lib/functions/email_api.php
 */
$g_smtp_host        = 'tl_smtp';  # SMTP server MUST BE configured
//$g_smtp_host        = '172.20.0.3';  # SMTP server MUST BE configured

/**
 * The smtp port to use.  The typical SMTP ports are 25 and 587.  The port to use
 * will depend on the SMTP server configuration and hence others may be used.
 * @global int $g_smtp_port
 */
$g_smtp_port = 1025;    # default mailhog smtp port                     

# Configure using custom_config.inc.php
$g_tl_admin_email     = 'tl_admin@example.com'; # for problem/error notification
$g_from_email         = 'testlink@example.com';  # email sender
$g_return_path_email  = 'testlink@example.com';

?>