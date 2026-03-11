FROM php:8.2-fpm
# Gerekli sistem paketlerini kur (Composer ve Laravel için)
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip pdo pdo_mysql

# Composer'ı resmi imajdan kopyala
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

