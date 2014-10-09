#!/usr/bin/env bash

######## AppFirst Collector Install ########
dpkg -i packages/appfirst-x86_64.deb

######## Update Repos ########
apt-get update

######## Install Additional Packages as Desired ########
apt-get install -y mysql-client
apt-get install -y inotify-tools

######## Apache prefork (magento standard install) #########
apt-get install -y apache2 
apt-get install -y php5 php5-mhash php5-mcrypt php5-curl php5-cli php5-mysql php5-gd

######## Installing Magento from /packages  #########
cp -a packages/*.tar.gz .
tar zxf magento-1.9.0.1.tar.gz
tar zxf magento-sample-data-1.9.0.0.tar.gz
chown vagrant:vagrant -R magento
chown vagrant:vagrant -R magento-sample-data-1.9.0.0

mv -f -n magento-sample-data-1.9.0.0/media/* magento/media
chmod -R o+w magento/media magento/var
chmod o+w magento/var magento/var/.htaccess magento/app/etc
rm -rf magento-1.9.0.1.tar.gz magento-sample-data-1.9.0.0/ magento-sample-data-1.9.0.0.tar.gz 

######## Link /var/www to Vagrant Home Directory #########
# At some point this should be it's own web user, ie - www-data
rm -rf /var/www
ln -fs /home/vagrant/magento /var/www

######## Make configuration file changes ########
sed -i 's/memory_limit = 128M/memory_limit = 512M/' /etc/php5/apache2/php.ini 
sed -i '0,/AllowOverride/! {0,/AllowOverride/ s/AllowOverride None/AllowOverride All/}' /etc/apache2/sites-available/default
ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/

######## Restart Apache Service on Completion #########
service apache2 restart

######## Can only run the command line install if the DB is already up ############
# Also, requires the address of the DB node
# php -f install.php --license_agreement_accepted "yes" --locale "en_US" --timezone "America/Los_Angeles" --default_currency "USD" --db_host "<DB_HOST>" --db_name "<DB_NAME>" --db_user "<DB_UNAME>" --db_pass "<DB_PASS>" --url "<SITE_URL>" --use_rewrites "yes" --use_secure "no" --secure_base_url "" --use_secure_admin "no" --admin_firstname "<ADMIN_FIRST>" --admin_lastname "<ADMIN_LAST>" --admin_email "<ADMIN_EMAIL>" --admin_username "<ADMIN_UNAME>" --admin_password "<ADMIN_PASS>"

