FROM php:8-fpm

RUN apt-get update

RUN mkdir /application

WORKDIR /application

COPY . ./

COPY www.conf /usr/local/etc/php-fpm.d/www.conf
RUN chown -R www-data:www-data /usr/local/etc/php-fpm.d

# set php-fpm conf env variables
ENV PHP_FPM_PM="dynamic"
ENV PHP_FPM_MAX_CHILDREN="1"
ENV PHP_FPM_START_SERVERS="1"
ENV PHP_FPM_MIN_SPARE_SERVERS="1"
ENV PHP_FPM_MAX_SPARE_SERVERS="1"
ENV PHP_FPM_MAX_REQUESTS="100"

RUN chown www-data:www-data /application

# change user
USER www-data

