FROM php:8.2-cli

RUN apt-get update 
RUN apt-get install -y lsof procps
RUN pecl install -o -f xdebug
RUN docker-php-ext-enable xdebug

COPY ./php.ini /usr/local/etc/php/

COPY . /var/www
WORKDIR /var/www

RUN mkdir -p /etc/natas_webpass
RUN echo "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley" > /etc/natas_webpass/natas10

CMD ["php", "-S", "0.0.0.0:8000", "-t", "."]
