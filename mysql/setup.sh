#!/bin/bash

set -e 

service mysql start

cd /opt/openhds/install/mysql

USER=$1
PW=$2

sed 's/__USER__/'$USER'/g' init.sql.in > init.sql.in.1
sed 's/__PW__/'$PW'/' init.sql.in.1 > init.sql

mysql --user="root" --password="" < init.sql

exit 0
