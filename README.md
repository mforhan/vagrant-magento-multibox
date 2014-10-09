Vagrant Magento Install
=======================

Vagrant files for creating a multibox deploy of Magento. This configuration will deploy a MySQL database server and a separate Apache2 web server. 

Prerequsites
------------
AppFirst installation package
Magento installation package
[Optional] Magento sample data package

These files should be stored in ./packages/ for sync mounting to the vagrant image

Installation Steps
------------------
1) Edit config.sh
	a) Add appropriate values
	b) run config.sh 
1) Edit Vagrantfile
	a)  verify network settings
	b)  synced folder location (with required packages)
2) Edit mysql-bootstrap.sh 
	a) verify debconf root password
	b) verify magento user database password
	c) verify database name
3) Edit apache-bootstrap.sh
	a) verify php install.php command options

dbnode
------
MySQL server installation. This includes enabling remote access to the database and the setup of a user/database for magento.

webnode
-------
Apache2 install with mpm-prefork as setup by the magento install tutorial. Eventually I'll provide an alternative mpm-worker version as I work out the deployment details. 

default web user: vagrant
default web directory: /home/vagrant/magento

TODO
----
The location of the website will eventually be updated to a non-shell user like www-data
Relocation of web docroot to an normalized location


-legalese-
This code is hackery, and not particularly good at that. Use at your own risk. If you find it useful and improve the code, please request to merge. If you are aware of other tools that do this better, faster and cheaper: please let me know.
