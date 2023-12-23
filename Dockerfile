FROM php:8.2-cli

RUN apt-get update 
RUN apt-get install -y lsof procps
RUN pecl install -o -f xdebug
RUN docker-php-ext-enable xdebug

COPY ./php.ini /usr/local/etc/php/

COPY . /var/www
WORKDIR /var/www

CMD ["php", "-S", "0.0.0.0:8000", "-t", "."]
