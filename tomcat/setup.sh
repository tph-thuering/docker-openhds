#!/bin/bash

set -e

## Create Tomcat manager-gui user to operate the "/manager/html" web application

# Adds in tomcat-users section:
## <role rolename="manager-gui" />
## <user username="${user} password="${pw}" roles="manager-gui" />

ROLE="manager-gui"
USER=$1
PW=$2

sed -i 's%</tomcat-users>%  <role rolename="'$ROLE'"/>\n  <user username="'$USER'" password="'$PW'" roles="'$ROLE'"/>\n</tomcat-users>%' /etc/tomcat6/tomcat-users.xml

## Increase Tomcat mem allocation:
## edit /etc/default/tomcat6
## JAVA_OPTS='-Xmx1024M -Xms1024M'

X="1024M"
S="1024M"

sed -i 's%JAVA_OPTS="-Djava.awt.headless=true -Xmx128m -XX:+UseConcMarkSweepGC"%JAVA_OPTS="-Djava.awt.headless=true -Xmx'$X' -Xms'$S' -XX:+UseConcMarkSweepGC"%' /etc/default/tomcat6

service tomcat6 start

exit 0
