FROM php:8.2-cli

# Install required packages
RUN apt-get update \
    && apt-get install -y lsof procps \
    && docker-php-ext-install pdo_mysql

# Install Xdebug
RUN pecl install -o -f xdebug \
    && docker-php-ext-enable xdebug

# Copy PHP configuration
COPY ./php.ini /usr/local/etc/php/

# Copy the application code
COPY . /var/www
WORKDIR /var/www

# Create MySQL database and table
RUN mkdir -p /etc/natas_webpass \
    && service mysql start \
    && mysql -e "CREATE DATABASE IF NOT EXISTS ctf;" \
    && mysql -e "USE ctf; CREATE TABLE IF NOT EXISTS users (username VARCHAR(255), password VARCHAR(255));" \
    && mysql -e "USE ctf; INSERT INTO users (username, password) VALUES ('argus', 'https://variety.com/wp-content/uploads/2021/07/Rick-Astley-Never-Gonna-Give-You-Up.png?w=1000&h=563&crop=1&resize=1000%2C563');"

# Set up CMD for running PHP server
CMD ["php", "-S", "0.0.0.0:8000", "-t", "."]
