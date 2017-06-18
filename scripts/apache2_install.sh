#!/usr/bin/env bash

sudo apt-get install apache2
sed -i.bak 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www/g' /etc/apache2/sites-available/000-default.conf
rm -rf /var/www/html
sudo chown -R $USER:$USER /var/www/
