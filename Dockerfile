# Dockerfile
FROM php:8.1-cli

RUN apt-get update && apt-get install -y git unzip curl

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN git clone https://github.com/stefanzweifel/minidash.git . && \
    composer install --no-dev --optimize-autoloader

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
