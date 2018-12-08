FROM php:7.1-apache

MAINTAINER Grupa4

##update
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	libfreetype6-dev \
	libicu-dev \
        libssl-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libedit-dev \
	libedit2 \
	libxslt1-dev \
	apt-utils \
	gnupg \
	redis-tools \
	mysql-client \
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

##php addons repo
RUN docker-php-ext-configure \
  	gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
  	docker-php-ext-install \
  	opcache \
  	gd \
  	bcmath \
  	intl \
  	mbstring \
  	mcrypt \
  	pdo_mysql \
  	soap \
  	xsl \
  	zip

##update
RUN apt-get update -y

##copy magento
COPY src/ /var/www/html


##set config
##RUN sed -i -e"s/^memory_limit\s*=\s*128M/memory_limit = 512M/" /etc/php/7.1/apache2/php.ini
RUN sed -i "s/None/all/g" /etc/apache2/apache2.conf 

##czyszczenie cache
##RUN cd /var/www/html/
##RUN php bin/magento indexer:reindex

##php addons
RUN chmod 777 -Rf /var/www /var/www/.* \
	&& chown -Rf www-data:www-data /var/www /var/www/.* \
	&& usermod -u 1000 www-data \
	&& chsh -s /bin/bash www-data\
	&& a2enmod rewrite \
	&& a2enmod headers

EXPOSE 80
