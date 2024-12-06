FROM php:8.1-fpm

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y nginx libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql gd zip

# Copy application files
WORKDIR /var/www/html
COPY . .

# Ensure required directories exist
RUN mkdir -p /var/www/html/storage /var/www/html/web/uploads

# Set permissions for storage and uploads
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/web/uploads

# Configure NGINX
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Start NGINX and PHP-FPM
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
