# Use the NGINX image for a static site
FROM nginx:latest

# Copy your app into the container
COPY . /var/www/html

# Copy your custom NGINX configuration
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Set permissions (if needed)
RUN chmod -R 755 /var/www/html

# Expose the required port
EXPOSE 80
