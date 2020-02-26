
#!/bin/bash
# **************************************************
# Copyright (C) Luiko Czub
# **************************************************

TL_PHP_BASE=/var/www/html
TL_PHP_DB_CONFIG_FILE=$TL_PHP_BASE/config_db.inc.php

if [ -f $TL_PHP_DB_CONFIG_FILE ]; then 
  echo DB config already created - $TL_PHP_DB_CONFIG_FILE
else
  echo start creating DB config - $TL_PHP_DB_CONFIG_FILE
  cat <<EOF >> $TL_PHP_DB_CONFIG_FILE
<?php
// connection params $TL_DB_NAME
define('DB_TYPE', 'postgres');
define('DB_USER', '$TL_DB_USER');
define('DB_PASS', '$TL_DB_PASSWORD');
define('DB_HOST', '$TL_DB_HOST');
define('DB_NAME', '$TL_DB_NAME');
define('DB_TABLE_PREFIX', '');
?>
EOF
  cat $TL_PHP_DB_CONFIG_FILE
fi








