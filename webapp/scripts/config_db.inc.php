<?php
// connection params $TL_DB_NAME
define('DB_TYPE', 'postgres');
define('DB_USER', getenv('TL_DB_USER'));
define('DB_PASS', getenv('TL_DB_PASSWORD'));
define('DB_HOST', getenv('TL_DB_HOST'));
define('DB_NAME', getenv('TL_DB_NAME'));
define('DB_TABLE_PREFIX', '');
?>