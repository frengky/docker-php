ARG ALPINE_VERSION=latest

FROM alpine:${ALPINE_VERSION}
LABEL maintainer="frengky.lim@gmail.com"

ARG TIMEZONE=Asia/Jakarta
ARG APP_UID=1000
ARG APP_GID=1000

RUN apk -U upgrade && \
    apk --update --no-cache add \
    tzdata \
    ca-certificates \
    php7 \
    php7-bcmath \
    php7-curl \
    php7-ctype \
    php7-dom \
    php7-exif \
    php7-mbstring \
    php7-mysqli \
    php7-fileinfo \
    php7-gd \
    php7-iconv \
    php7-pgsql \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-pcntl \
    php7-redis \
    php7-opcache \
    php7-openssl \
    php7-phar \
    php7-sockets \
    php7-sodium \
    php7-sqlite3 \
    php7-simplexml \
    php7-tokenizer \
    php7-xml \
    php7-xmlreader \
    php7-xmlwriter \
    php7-zip \
    php7-pecl-imagick && \
    cp "/usr/share/zoneinfo/${TIMEZONE}" /etc/localtime && \
    echo ${TIMEZONE} > /etc/timezone && \
    apk del tzdata && \
    addgroup -g ${APP_GID} app && \
    adduser -S -D -u ${APP_UID} -s /bin/ash -h /app -G app app && \
    sed -i "s|;*date.timezone =.*|date.timezone = ${TIMEZONE}|i" /etc/php7/php.ini && \
    sed -i "s|;*curl.cainfo =.*|curl.cainfo=/etc/ssl/certs/ca-certificates.crt|i" /etc/php7/php.ini && \
    sed -i "s|;*openssl.cafile=.*|openssl.cafile=/etc/ssl/certs/ca-certificates.crt|i" /etc/php7/php.ini && \
    rm -rf /var/cache/apk/*

ENV DEFAULT_TZ ${TIMEZONE}
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV CURL_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt
