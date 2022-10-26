FROM php:8.1.0-fpm

COPY docker/php/php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y \
            libfreetype6-dev \
            libjpeg62-turbo-dev \
            libpng-dev \
            libpq-dev \
            zip \
            git \
            iputils-ping


RUN apt-get install -y --no-install-recommends \
    supervisor

RUN docker-php-ext-install pdo_pgsql && docker-php-ext-enable pdo_pgsql

#RUN yes | pecl install xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
