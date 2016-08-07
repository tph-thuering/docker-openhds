#!/bin/bash

cd /opt/openhds/install

. .env

mysql/setup.sh $MYSQL_USER $MYSQL_PW
tomcat/setup.sh $TOMCAT_USER $TOMCAT_PW
openhds/setup.sh

exit 0
