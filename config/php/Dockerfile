FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        libfreetype6-dev \
		libjpeg-dev \
		libpng-dev \
		libfreetype6-dev \
        libmcrypt-dev \
        libpng-dev \
		libicu-dev \
		libedit-dev \
		libxml2-dev \
		libxslt1-dev \
		libzip-dev \
        libbz2-dev \
		libc-client2007e-dev \
		libkrb5-dev \
		libpq-dev\
		libmemcached-dev \
    && docker-php-ext-install -j$(nproc) bz2 intl json mbstring mysqli pdo_mysql opcache readline soap xml xsl zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt \
	&& pecl install memcached-3.1.3 \
	&& docker-php-ext-enable memcached

WORKDIR /var/www

CMD ["php-fpm"]
