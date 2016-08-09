#!/bin/bash

set -e

INSTALL=/opt/mirthconnect

tar xzf /mirthconnect-3.4.1.8057.b139-unix.tar.gz "Mirth Connect"
mv "Mirth Connect" $INSTALL

#bash /mirthconnect-3.4.1.8057.b139-unix.sh

USER=$1
PW=$2
HTTP=$3
HTTPS=$4

# configure
CONFIG=/opt/mirthconnect/conf/mirth.properties

sed -i 's%dir.appdata = appdata%dir.appdata = /opt/mirthconnect/appdata%' $CONFIG

sed -i 's/http.port = 8080/http.port = '$HTTP'/' $CONFIG

sed -i 's/https.port = 8443/https.port = '$HTTPS'/' $CONFIG

sed -i 's/database = derby/database = mysql/' $CONFIG

#sed -i 's%database.url = jdbc:derby:${dir.appdata}/mirthdb;create=true;upgrade=true%database.url = jdbc:mysql://localhost:3306/mirthdb%' $CONFIG
sed -i 's%database.url = jdbc:derby:${dir.appdata}/mirthdb;create=true%database.url = jdbc:mysql://localhost:3306/mirthdb%' $CONFIG

sed -i 's/database.username =/database.username = '$USER'/' $CONFIG

sed -i 's/database.password =/database.password = '$PW'/' $CONFIG

/opt/mirthconnect/mcservice start

exit 0
