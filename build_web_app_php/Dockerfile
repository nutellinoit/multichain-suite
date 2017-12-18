FROM php:5.6-fpm
MAINTAINER Samuele Chiocca
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
RUN apt-get install php-pear -y
RUN pear channel-discover pear.phpdoc.org
RUN pear install phpdoc/phpDocumentor

ADD ./rootfs /code

