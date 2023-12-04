# Use the official PHP 7.3 Apache image as the base image
FROM php:7.3-apache

# Install system dependencies and PHP extensions
# + mysqli pgsql for codeigniter
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zlib1g-dev \
    libpq-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql pdo_pgsql mysqli pgsql

# Enable Apache modules and restart Apache
RUN a2enmod rewrite && service apache2 restart

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy your application files into the container
COPY . /var/www/html

# Change permission of directory /var/www/html to www-data
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for Apache
EXPOSE 80

# Define environment variables for MySQL
# ENV MYSQL_HOST=mysql \
#     MYSQL_PORT=3306 \
#     MYSQL_USER=root \
#     MYSQL_PASSWORD=password

# Optionally, you can set other environment variables here if needed

# Start Apache in the foreground
CMD ["apache2-foreground"]
