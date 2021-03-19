#!/bin/sh
set -eo pipefail

if [ "$1" = "php-fpm8" ]; then

    if [ -n "$PHP_EXT_XDEBUG" ]; then
        echo -en ';extension=pcov.so\n;pcov.enabled=1\n;pcov.directory=app\n' > /etc/php8/conf.d/pcov.ini
        printf "\
zend_extension=xdebug.so\n\
xdebug.mode=debug\n\
xdebug.start_with_request=yes\n" > /etc/php8/conf.d/50_xdebug.ini
    fi

fi

exec "$@"