FROM php:7.4-fpm

# Install libraries
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    zip \
    libjpeg-dev\
    libpng-dev\
    libfreetype6-dev \
    libpq-dev \
    libicu-dev g++

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql zip gd intl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Setup php
COPY php.ini /usr/local/etc/php/php.ini

# Setup xdebug
RUN pecl install xdebug-3.1.4 \
    && docker-php-ext-enable xdebug
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini    

WORKDIR /var/www

EXPOSE 9000

CMD ["php-fpm"]