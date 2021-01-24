# Derives from debian:buster-slim
FROM php:fpm

WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev

RUN   docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete

COPY . .

# Adds php, php-fpm config and entrypoint files
COPY docker/ /

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
