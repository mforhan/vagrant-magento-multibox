Vagrant Magento Install
=======================

Vagrant files for creating a multibox deploy of Magento. This configuration will deploy a MySQL database server and a separate Apache2 web server. 

Prerequsites
------------
*AppFirst installation package
*Magento installation package
*[Optional] Magento sample data package

These files should be stored in ./packages/ for sync mounting to the vagrant image

Installation Steps
------------------
<ol>
<li>Edit config.sh</li>
<ul>
	<li>Add appropriate values</li>
	<li>run config.sh</li>
</ul>
<li> Edit Vagrantfile</li>
<ul>
	<li>  verify network settings</li>
	<li>  synced folder location (with required packages)</li>
</ul>
<li> Edit mysql-bootstrap.sh </li>
<ul>
	<li> verify debconf root password</li>
	<li> verify magento user database password</li>
	<li> verify database name</li>
</ul>
<li> Edit apache-bootstrap.sh</li>
<ul>
	<li> verify php install.php command options</li>
</ul>
<ol>
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


<pre>
legalese
This code is hackery, and not particularly good at that. Use at your own risk. If you find it useful and improve the code, please request to merge. If you are aware of other tools that do this better, faster and cheaper: please let me know.
</pre>
