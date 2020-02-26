#!/bin/sh
# **************************************************
# Copyright (C) Luiko Czub
# **************************************************

THIS_INSTALL_DIR=`dirname "$0"`

# replace wrong '#' command line marker with '--'
replace_none_sql_comments (){
	echo correct wrong comment line marker in $1
	sed -i 's/^#/--/' $1
	
}

# remove mysql specific 'unsigned' attribute
remove_mysql_unsigned (){
	echo remove mysql specific unsigned attribute in $1
	sed -i 's/unsigned/ /' $1
}


if [ "${TL_RELEASE}" = "1.9.19" ]; then 
	replace_none_sql_comments "${THIS_INSTALL_DIR}/20-testlink_create_udf0.sql"
elif [ "${TL_RELEASE}" = "1.9.20" ]; then 
	remove_mysql_unsigned  "${THIS_INSTALL_DIR}/10-testlink_create_tables.sql"
fi

exit 0






