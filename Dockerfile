FROM php:7.3-apache

RUN apt-get update && \
    apt-get install -y \
    libfreetype6-dev \
    libgd-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libjpeg-dev \
    libpq-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql

RUN chown -R www-data:www-data /var/www/html/
