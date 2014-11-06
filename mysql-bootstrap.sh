#!/usr/bin/env bash

######## AppFirst Collector Install ########
dpkg -i packages/appfirst-x86_64.deb

######## Update Repos ########
apt-get update

######## Install / Configure MySQL ########
debconf-set-selections <<< 'mysql-server mysql-server/root_password password <DB_ROOT_PASS>'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password <DB_ROOT_PASS>'
apt-get install -y mysql-server mysql-client

######## Install Additional Packages as Desired ########
apt-get install -y inotify-tools

######## Magento Installation ########
# wget http://www.magentocommerce.com/downloads/assets/1.9.0.0/magento-sample-data-1.9.0.0.tar.gz

cp -a packages/magento-sample-data-1.9.0.0.tar.gz .
tar zxf magento-sample-data-1.9.0.0.tar.gz

mysql -h localhost -u root -p<DB_ROOT_PASS> mysql -e "create user '<DB_UNAME>'@'%' identified by '<DB_PASS>'" 
mysql -h localhost -u root -p<DB_ROOT_PASS> mysql -e "create database <DB_NAME>"

######## Good practice to not use 'grant all' ########
mysql -h localhost -u root -p<DB_ROOT_PASS> mysql -e "grant all on <DB_NAME>.* to '<DB_UNAME>'@'%'"
mysql -h localhost -u root -p<DB_ROOT_PASS> mysql -e "flush privileges"
mysql -h localhost -u magento -pmagento magento < magento-sample-data-1.9.0.0/magento_sample_data_for_1.9.0.0.sql
rm -rf magento-sample-data-1.9.0.0/ magento-sample-data-1.9.0.0.tar.gz 

######## Enable MySQL Remote Access ########
sed -i 's/bind-address/#bind-address/' /etc/mysql/my.cnf
service mysql restart

# Update the init file so all logs and tags are applied
cp ~vagrant/packages/AppFirst.init.db /etc/AppFirst.init
service afcollector restart
