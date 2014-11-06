#!/usr/bin/env bash

DB_HOST='<IP_ADDR>'
APACHE_HOST=''<IP_ADDR>'
DB_NAME='<MAGENTO_DBNAME>'
DB_UNAME='<MAGENTO_UNAME>'
DB_PASS='<MAGENTO_PASS>'
DB_ROOT_PASS='<ROOT_PASS>'
ADMIN_FIRST='<ADMIN_FIRST>'
ADMIN_LAST='<ADMIN_LAST>'
ADMIN_EMAIL='<ADMIN_EMAIL>'
ADMIN_UNAME='<ADMIN_UNAME>'
ADMIN_PASS=$DB_ROOT_PASS

######## Replace Values in Vagrantfile ########
sed -i.bak 's/<DB_HOST>/'$DB_HOST'/' ./Vagrantfile
sed -i.bak 's/<APACHE_HOST>/'$APACHE_HOST'/' ./Vagrantfile

######## Replace Values in mysql-bootstrap.sh ########
sed -i.bak 's/<DB_HOST>/'$DB_HOST'/' ./mysql-bootstrap.sh
sed -i.bak 's/<DB_NAME>/'$DB_NAME'/' ./mysql-bootstrap.sh
sed -i.bak 's/<DB_UNAME>/'$DB_UNAME'/' ./mysql-bootstrap.sh
sed -i.bak 's/<DB_PASS>/'$DB_PASS'/' ./mysql-bootstrap.sh
sed -i.bak 's/<DB_ROOT_PASS>/'$DB_ROOT_PASS'/' ./mysql-bootstrap.sh

######## Replace Values in apache-bootstrap.sh ########
sed -i.bak 's/<DB_HOST>/'$DB_HOST'/' ./apache-bootstrap.sh
sed -i.bak 's/<DB_NAME>/'$DB_NAME'/' ./apache-bootstrap.sh
sed -i.bak 's/<DB_UNAME>/'$DB_UNAME'/' ./apache-bootstrap.sh
sed -i.bak 's/<DB_PASS>/'$DB_PASS'/' ./apache-bootstrap.sh
sed -i.bak 's/<APACHE_HOST>/'$APACHE_HOST'/' ./apache-bootstrap.sh
sed -i.bak 's/<SITE_URL>/http:\/\/'$APACHE_HOST'\//' ./apache-bootstrap.sh
sed -i.bak 's/<ADMIN_FIRST>/'$ADMIN_FIRST'/' ./apache-bootstrap.sh
sed -i.bak 's/<ADMIN_LAST>/'$ADMIN_LAST'/' ./apache-bootstrap.sh
sed -i.bak 's/<ADMIN_EMAIL>/'$ADMIN_EMAIL'/' ./apache-bootstrap.sh
sed -i.bak 's/<ADMIN_UNAME>/'$ADMIN_UNAME'/' ./apache-bootstrap.sh
sed -i.bak 's/<ADMIN_PASS>/'$ADMIN_PASS'/' ./apache-bootstrap.sh
