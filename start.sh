#!/bin/sh

# set port number to be listened as $PORT or 8888
sed -i -E "s/TO_BE_REPLACED_WITH_PORT/${PORT:-8888}/" /etc/nginx/conf.d/*.conf

# "/var/tmp/nginx" owned by "nginx" user is unusable on heroku dyno so re-create on runtime
mkdir /var/tmp/nginx

# make php-fpm be able to listen request from nginx (current user is nginx executor)
sed -i -E "s/^;listen.owner = .*/listen.owner = $(whoami)/" /etc/php7/php-fpm.d/www.conf

# make current user the executor of nginx and php-fpm expressly for local environment
sed -i -E "s/^user = .*/user = $(whoami)/" /etc/php7/php-fpm.d/www.conf
sed -i -E "s/^group = (.*)/;group = \1/" /etc/php7/php-fpm.d/www.conf
sed -i -E "s/^user .*/user $(whoami);/" /etc/nginx/nginx.conf

supervisord --nodaemon --configuration /etc/supervisord.conf
