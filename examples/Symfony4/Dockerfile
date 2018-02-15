FROM ttskch/nginx-php-fpm-heroku

RUN \
    # install npm
    apk --update add nodejs-npm \
    \
    # remove caches to decrease image size
    && rm -rf /var/cache/apk/* \
    \
    # tweak to set env to prod, and re-do composer install
    && sed -i -E "s/APP_ENV=dev/APP_ENV=prod/" .env \
    && composer install --no-interaction \
    && chmod -R a+w $DOCROOT

# if you need
#COPY docker/php.ini $PHP_INI_DIR/

COPY docker/nginx.conf $NGINX_CONFD_DIR/symfony4-site.conf

USER nonroot
