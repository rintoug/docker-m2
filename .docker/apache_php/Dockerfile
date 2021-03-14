FROM php:7.4-apache

# Install System Dependencies

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	#Added New
	zlib1g-dev \
	libpng-dev \
	libjpeg-dev \
	#Added New End
#	nodejs \
	libfreetype6-dev \
	libicu-dev \
    libssl-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libedit-dev \
	libedit2 \
	libxslt1-dev \
	libzip-dev \
	apt-utils \
	gnupg \
	redis-tools \
	mariadb-client \
	git \
	vim \
	wget \
	curl \
	lynx \
	psmisc \
	unzip \
	tar \
	cron \
	bash-completion \
	&& apt-get clean

# Install Magento Dependencies

RUN docker-php-ext-configure gd --with-jpeg --with-freetype=/usr/include/ &&  \
  	#gd --with-jpeg=/usr/include/ \
  	docker-php-ext-install \
  	opcache \
  	gd \
  	bcmath \
  	intl \
#  	mbstring \
  	mysqli \
  	pdo_mysql \
  	soap \
  	xsl \
  	zip \
  	sockets

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer self-update --1


#RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && apt-get install -y nodejs && apt-get install -y npm

# RUN apt-get install nodejs -y && apt-get install npm -y

#RUN curl -o- -L https://yarnpkg.com/install.sh | bash

RUN a2enmod rewrite && service apache2 restart

COPY apache_config.conf /etc/apache2/sites-enabled/000-default.conf

COPY php.ini /usr/local/etc/php/php.ini