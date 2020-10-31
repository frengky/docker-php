FROM alpine:latest
LABEL maintainer="frengky.lim@gmail.com"

RUN apk -U upgrade && \
    apk --update --no-cache add \
    tzdata \
    ca-certificates \
    grpc protobuf \
    php7 \
    php7-bcmath \
    php7-ctype \
    php7-exif \
    php7-mbstring \
    php7-mysqli \
    php7-fileinfo \
    php7-gd \
    php7-pgsql \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-pcntl \
    php7-redis \
    php7-opcache \
    php7-openssl \
    php7-sockets \
    php7-sqlite3 \
    php7-simplexml \
    php7-tokenizer \
    php7-xml \
    php7-zip \
    php7-pecl-protobuf \
    php7-pecl-imagick \
    php7-fpm && \
    cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && \
    echo "Asia/Jakarta" > /etc/timezone && \
    apk del tzdata && \
    addgroup -g 1000 app && \
    adduser -S -D -u 1000 -s /bin/ash -h /var/www -G app app && \
    sed -i "s|;*date.timezone =.*|date.timezone = Asia/Jakarta|i" /etc/php7/php.ini && \
    sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo=0|i" /etc/php7/php.ini && \
    sed -i "s|;*curl.cainfo =.*|curl.cainfo=/etc/ssl/certs/ca-certificates.crt|i" /etc/php7/php.ini && \
    rm -rf /var/cache/apk/*

ENV DEFAULT_TZ Asia/Jakarta
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV CURL_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt

COPY --from=frengky/php-grpc /usr/lib/php7/modules/grpc.so /usr/lib/php7/modules/
COPY --from=frengky/php-grpc /etc/php7/conf.d/grpc.ini /etc/php7/conf.d/

COPY php-fpm.conf /etc/php7/
COPY www.conf /etc/php7/php-fpm.d/