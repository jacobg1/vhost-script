#!/bin/bash

read -p "please enter name of site: " name
read -p "please enter alias, ex: local, test, etc: " extention

if ! echo '127.0.0.1     '     $name.$extention >> /etc/hosts
then

    echo $"ERROR: Not able to update vhosts try running as sudo"
    exit;
else
    echo "Success! Wrote to /etc/hosts"
fi

#enter the path of your document root here
docRoot=/Users/jgreenwald/Documents/production/

 if ! echo "
 <VirtualHost *:80>
    DocumentRoot '$docRoot$name'
    ServerName $name.$extention
    <Directory $docRoot$name >
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
</VirtualHost>" >> /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
then
    echo $"ERROR: Not able to update vhosts try again"
    exit;
else
    echo "Success! Wrote to httpd-vhosts.conf"
fi
