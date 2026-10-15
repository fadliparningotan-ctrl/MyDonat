FROM php:8.3-apache

RUN docker-php-ext-install mysqli \
 && a2enmod rewrite headers

# Izinkan .htaccess, set ServerName, batas upload
RUN printf '<Directory /var/www/html>\n    AllowOverride All\n    Require all granted\n</Directory>\nServerName localhost\n' > /etc/apache2/conf-available/app.conf \
 && a2enconf app \
 && printf 'upload_max_filesize=4M\npost_max_size=6M\nsession.cookie_secure=1\n' > /usr/local/etc/php/conf.d/app.ini

COPY www/ /var/www/html/
COPY schema.sql /var/www/schema.sql
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
 && chown -R www-data:www-data /var/www/html

CMD ["docker-entrypoint.sh"]
