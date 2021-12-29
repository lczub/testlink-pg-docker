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

# fix corrupt 1920 testlink_create_tables.sql
fix_create_tables_1920 (){
	echo remove mysql specific unsigned attribute in $1
	sed -i 's/unsigned/ /' $1
	echo rename baseline_l1l2_context.being_exec_ts to .begin_exec_ts in $1
	sed -i 's/being_exec_ts/begin_exec_ts/' $1
	echo rename baseline_l1l2_context index in $1
	sed -i 's/udx1 ON/udx1_context ON/' $1
	echo rename baseline_l1l2_details indexes in $1
	sed -i 's/udx1 /udx1_details /' $1
}


if [ "${TL_RELEASE}" = "1.9.19" ]; then 
	replace_none_sql_comments "${THIS_INSTALL_DIR}/20-testlink_create_udf0.sql"
elif [ "${TL_RELEASE}" = "1.9.20" ]; then 
	fix_create_tables_1920  "${THIS_INSTALL_DIR}/10-testlink_create_tables.sql"
elif [ "${TL_RELEASE}" = "2.0.0.dev" ]; then 
	fix_create_tables_1920  "${THIS_INSTALL_DIR}/10-testlink_create_tables.sql"
fi

exit 0






