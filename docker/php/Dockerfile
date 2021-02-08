FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
        supervisor \
        cron \
        curl \
        wget \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
	libpng-dev \
	libonig-dev \
	libzip-dev \
	libmcrypt-dev \
        && pecl install mcrypt-1.0.3 \
	&& docker-php-ext-enable mcrypt \
        && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
        && docker-php-ext-install -j$(nproc) gd 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# ADD ./config/cron.root /var/spool/cron/crontabs/root
# RUN chown -R root:crontab /var/spool/cron/crontabs/root && chmod 600 /var/spool/cron/crontabs/root
# RUN touch /var/log/cron.log

WORKDIR /var/www/mams.me

CMD ["sh", "./init.sh"]