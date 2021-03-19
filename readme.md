# PHP docker base container

Multipurpose PHP docker image based on [Alpine Linux](https://alpinelinux.org/).
This image can be used for building your own LEMP container stack (compose) also for unit testing.
Available variants `frengky/php:7`, `frengky/php:7-fpm`, `frengky/php:8`, `frengky/php:8-fpm`

Included extensions:
* [pcov v1.0.6](https://github.com/krakjoe/pcov)
* [xdebug v3](https://xdebug.org/)
* [grpc](https://grpc.io/docs/languages/php/quickstart/)
* [protobuf](https://developers.google.com/protocol-buffers/)

## PHP CLI

Example command to run php cli (`pcov` automatically enabled)
```console
$ docker run -it --rm frengky/php:7 php -v
```

## PHP FPM

Example command to run php-fpm, with (`xdebug` enabled, `pcov` are automatically disabled)
```console
$ docker run -it --rm -v $(pwd):/app -p 9000:9000 -e PHP_EXT_XDEBUG=1 -e XDEBUG_CONFIG="client_host=host.docker.internal" frengky/php:7-fpm
```

*Environment variables*:

| Name | Description | Example Value |
|------|-------------|---------------|
| PHP_EXT_XDEBUG | Enable XDEBUG extension | 1 |
| XDEBUG_CONFIG | [XDEBUG configuration](https://xdebug.org/docs/all_settings) | client_host=host.docker.internal |
| PHP_INI_SENDMAIL_PATH | PHP ini sendmail path | /usr/sbin/sendmail -S your-mail-host:3025 -t -i |
