# PHP docker base container

Multipurpose php base container based on Alpine Linux.
This image can be used for building your own LEMP container stack (compose) also for unit testing.

## General usage

The `frengky/php:latest` is a base php container with php cli command only.

Running the php cli:
```console
$ docker run -it --rm frengky/php php -v
```

## Test runner version

The `frengky/php:test-runner`, is another php multipurpose container variant created for running unit tests.
The `xdebug` php extension are not installed, since the incompatibility issue with the `pcov` extension.

Included test coverage extension:
* [pcov](https://github.com/krakjoe/pcov)

Installed commands:
* [composer](https://getcomposer.org)
* [phpunit](https://phpunit.de/index.html)
* [phpcs](https://github.com/squizlabs/PHP_CodeSniffer) and [phpcbf](https://github.com/squizlabs/PHP_CodeSniffer)
* [php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer)
* [security-checker](https://github.com/sensiolabs/security-checker)
* [phpcpd](https://github.com/sebastianbergmann/phpcpd)
* [phploc](https://github.com/sebastianbergmann/phploc)
* [phpmd](https://phpmd.org)
* [paratest](https://github.com/paratestphp/paratest)
* [phpmetrics](https://www.phpmetrics.org)

Example running php unit in the current directory:
```console
$ docker run -it --rm -v $(pwd):/app frengky/php:test-runner phpunit
```

## PHP gRPC version

Generate php `gRPC` code from `src/*.proto` to `output/` :
```
docker run -it --rm --name grpc -v $(pwd)/src:/src -v $(pwd)/output:/output frengky/php-grpc
```
> Quick start at [grpc.io](https://grpc.io/docs/languages/php/quickstart/)