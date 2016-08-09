#!/bin/bash

cd /opt/openhds/install

. .env

mysql/setup.sh $MYSQL_USER $MYSQL_PW
tomcat/setup.sh $TOMCAT_USER $TOMCAT_PW
mirth/setup.sh $MIRTH_USER $MIRTH_PW $MIRTH_PORT $MIRTH_ADM_PORT
openhds/setup.sh

exit 0
