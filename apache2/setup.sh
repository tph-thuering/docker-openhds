#!/bin/bash

set -e

ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-enabled/phpmyadmin.conf

service apache2 start

exit 0
