FROM php:8.4-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    git \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY ../ /var/www

RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

RUN composer install --no-dev --optimize-autoloader

COPY .env.develop .env

RUN php artisan key:generate

RUN chmod -R 777 storage bootstrap/cache

# Expose port 80 for Nginx
EXPOSE 80

# Configure Nginx (basic configuration - adjust as needed)
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Set user for artisan commands
USER www-data

# Start PHP-FPM and Nginx
CMD ["sh", "-c", "php-fpm8 & nginx -g 'daemon off;'"]

# Healthcheck (optional, but recommended)
HEALTHCHECK --start-period=5s --timeout=5s --interval=5s CMD curl -f http://localhost || exit 1