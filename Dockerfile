# FROM php:7.4-apache
FROM php:7.4-fpm

WORKDIR /var/www/html/
COPY . /var/www/html/

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		# gd
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		# gmp
		libgmp-dev \
		# soap
		libxml2-dev \
		# mbstring
		libonig-dev \
		# pdo
		libpq-dev \
		# others
		libwebp-dev \
		libxpm-dev \
		libzip-dev \
		vim \
		--allow-unauthenticated \
	&& docker-php-ext-configure gd --with-jpeg --with-freetype \
	&& docker-php-ext-install -j$(nproc) gmp gd soap mbstring pdo pdo_mysql
