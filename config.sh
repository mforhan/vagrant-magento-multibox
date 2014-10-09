#!/usr/bin/env bash

######## IP Addresses of each host ########
DB_HOST='10.0.0.5'
APACHE_HOST='10.0.0.6'

######## Database Credentials ########
DB_NAME='magento'
DB_UNAME='magento'
DB_PASS='magento'
DB_ROOT_PASS='your_pass_here'

######## Magento Backend Credentials ########
ADMIN_FIRST='FirstName'
ADMIN_LAST='LastName'
ADMIN_EMAIL='your_email@address'
ADMIN_UNAME='username'
ADMIN_PASS=$DB_ROOT_PASS

######## Replace Values in Vagrantfile ########
sed -i 's/<DB_HOST>/'$DB_HOST'/' ./Vagrantfile
sed -i 's/<APACHE_HOST>/'$APACHE_HOST'/' ./Vagrantfile

######## Replace Values in mysql-bootstrap.sh ########
sed -i 's/<DB_HOST>/'$DB_HOST'/' ./mysql-bootstrap.sh
sed -i 's/<DB_NAME>/'$DB_NAME'/' ./mysql-bootstrap.sh
sed -i 's/<DB_UNAME>/'$DB_UNAME'/' ./mysql-bootstrap.sh
sed -i 's/<DB_PASS>/'$DB_PASS'/' ./mysql-bootstrap.sh
sed -i 's/<DB_ROOT_PASS>/'$DB_ROOT_PASS'/' ./mysql-bootstrap.sh

######## Replace Values in apache-bootstrap.sh ########
sed -i 's/<DB_HOST>/'$DB_HOST'/' ./apache-bootstrap.sh
sed -i 's/<DB_NAME>/'$DB_NAME'/' ./apache-bootstrap.sh
sed -i 's/<DB_UNAME>/'$DB_UNAME'/' ./apache-bootstrap.sh
sed -i 's/<DB_PASS>/'$DB_PASS'/' ./apache-bootstrap.sh
sed -i 's/<APACHE_HOST>/'$APACHE_HOST'/' ./apache-bootstrap.sh
sed -i 's/<SITE_URL>/http:\/\/'$APACHE_HOST'\//' ./apache-bootstrap.sh
sed -i 's/<ADMIN_FIRST>/'$ADMIN_FIRST'/' ./apache-bootstrap.sh
sed -i 's/<ADMIN_LAST>/'$ADMIN_LAST'/' ./apache-bootstrap.sh
sed -i 's/<ADMIN_EMAIL>/'$ADMIN_EMAIL'/' ./apache-bootstrap.sh
sed -i 's/<ADMIN_UNAME>/'$ADMIN_UNAME'/' ./apache-bootstrap.sh
sed -i 's/<ADMIN_PASS>/'$ADMIN_PASS'/' ./apache-bootstrap.sh
