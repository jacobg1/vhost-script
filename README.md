# vhost-script
update /etc/hosts and httpd-vhosts.conf with bash script.

note: must be run as sudo

## setup
make vhosts.sh executable by running the following: chmod 744 vhost.sh

move vhosts.sh to /usr/local/bin

change docRoot variable to path of your document root

### alias
add the following to your .bash_profile, .zshrc, etc: alias vhost='sudo vhost.sh'

this will allow you to execute the script from anywhere on your machine by typing 'vhost' 

