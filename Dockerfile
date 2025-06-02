# Dockerfile
FROM php:8.1-cli

# Installeer benodigde packages
RUN apt-get update && apt-get install -y unzip curl git

# Composer installeren
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Werkdirectory
WORKDIR /var/www/html

# Kopieer alles uit je repository (Minidash moet al aanwezig zijn)
COPY . .

# Dependencies installeren
RUN composer install --no-dev --optimize-autoloader

# Poort instellen en server starten
EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
