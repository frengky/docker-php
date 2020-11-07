# PHP docker base container

Multipurpose php base container based on Alpine Linux with **php-fpm**.
This image can be used for building your own LEMP container stack (compose).

Some of the must-have extensions included here are:
* [grpc](https://github.com/grpc/grpc/tree/master/src/php)
* [protobuf](https://pecl.php.net/package/protobuf)
* [pcov](https://github.com/krakjoe/pcov)

## General usage
**Run php executable**
```
docker run -it --rm --name php frengky/php php -v
```

**RUN php-fpm instance**
```
docker run -it --rm --name php -p 9000:9000 frengky/php php-fpm7 -F
```

## Docker compose usage
**Configure as PHP FPM container**
```
web:
  image: frengky/php
  volumes:
    - ./app:/app
  entrypoint: php-fpm7 -F
  expose:
    - "9000"
  restart: always
```

## Customisable config files
| File paths |
|---|
|/etc/php7/php.ini|
|/etc/php7/php-fpm.conf|
|/etc/php7/php-fpm.d/www.conf|
