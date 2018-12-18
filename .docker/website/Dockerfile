FROM php:7.2.10-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends vim curl debconf subversion git apt-transport-https apt-utils build-essential locales acl mailutils wget zip unzip gnupg gnupg1 gnupg2 zlib1g-dev nano -y

RUN docker-php-ext-install pdo pdo_mysql zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - 
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

COPY .docker/website/php.ini /usr/local/etc/php/php.ini
COPY . /home/wwwroot/sf4

WORKDIR /home/wwwroot/sf4

RUN apt-get update
RUN composer install
RUN apt-get install nodejs -y
RUN apt-get install yarn -y
RUN yarn install -y
RUN yarn encore dev

COPY .docker/website/.env /home/wwwroot/sf4

RUN chmod 755 /home/wwwroot/sf4/var/cache/dev/*
RUN chown -R www-data:www-data /home/wwwroot/sf4/var/cache/dev/*
RUN chmod 755 /home/wwwroot/sf4/var/*
RUN chown -R www-data:www-data /home/wwwroot/sf4/var/*

RUN wget --no-check-certificate https://phar.phpunit.de/phpunit-6.5.3.phar && \
    mv phpunit*.phar phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit

RUN groupadd dev -g 999
RUN useradd dev -g dev -d /home/dev -m
RUN passwd -d dev

RUN rm -rf /var/lib/apt/lists/*
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN echo "dev ALL=(ALL) ALL" > /etc/sudoers

ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $HTTPD_PREFIX/bin:$PATH
RUN mkdir -p "$HTTPD_PREFIX" \
    && chown www-data:www-data "$HTTPD_PREFIX"
WORKDIR $HTTPD_PREFIX

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2 curl \
    && rm -r /var/lib/apt/lists/*
RUN a2enmod proxy_fcgi ssl rewrite proxy proxy_balancer proxy_http proxy_ajp
RUN sed -i '/Global configuration/a \
ServerName localhost \
' /etc/apache2/apache2.conf
EXPOSE 80 443
RUN rm -f /run/apache2/apache2.pid
CMD apachectl  -DFOREGROUND -e info

RUN rm -f /etc/apache2/sites-enabled/*
COPY .docker/config/vhosts /etc/apache2/sites-enabled