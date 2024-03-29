FROM php:8.1-fpm

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
    libicu-dev g++ \
    librabbitmq-dev

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql zip gd intl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --version=2.3.7 --install-dir=/usr/local/bin --filename=composer

# Setup php
COPY php.ini /usr/local/etc/php/php.ini

# Setup xdebug
RUN pecl install xdebug-3.1.4 \
    && docker-php-ext-enable xdebug
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini    

# Install amqp
RUN pecl install amqp \
    && docker-php-ext-enable amqp

WORKDIR /var/www

EXPOSE 9000

CMD ["php-fpm"]