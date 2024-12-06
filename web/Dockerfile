# Use the official PHP-FPM image
FROM php:8.1-fpm

# Install necessary dependencies and PHP extensions
RUN apt-get update && apt-get install -y nginx libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql gd zip

# Set the working directory to where your Craft app resides
WORKDIR /var/www/html

# Copy all project files into the container
COPY . .

# Ensure the correct permissions for Craft's storage and uploads
RUN mkdir -p /var/www/html/storage /var/www/html/web/uploads \
    && chown -R www-data:www-data /var/www/html/storage /var/www/html/web/uploads

# Copy the custom NGINX config file
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start NGINX and PHP-FPM services
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
