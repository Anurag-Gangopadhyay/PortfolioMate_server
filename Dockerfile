# Use an official PHP runtime as a parent image
FROM php:8.0-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Install any necessary PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Set permissions for the Apache user
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
