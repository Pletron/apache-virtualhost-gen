#!/bin/bash

hostDir=/var/www

fullurl="$(head -n 1 /var/www/site/Dockerfile | awk '{print $2}')"
subdomain=$(echo $fullurl | cut -f 1 -d ".")
IFS='.' read -r id sitename <<< "$fullurl"

echo $'<VirtualHost *:80>
    ServerName '$sitename'
    ServerAlias '$subdomain'.'$sitename'
    DocumentRoot '$hostDir'/site
    CustomLog '$hostDir'/site/access.log combined
    ErrorLog '$hostDir'/site/error.log
    <Directory "'$hostDir'/site">
      Options FollowSymLinks Includes MultiViews
      AllowOverride All
      Order allow,deny
      Allow from all
      Require all granted
    </Directory>
</VirtualHost>' > /etc/apache2/sites-available/$fullurl
ln -s /etc/apache2/sites-available/$fullurl /etc/apache2/sites-enabled/$fullurl
