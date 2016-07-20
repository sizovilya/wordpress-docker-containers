FROM smebberson/alpine-base:1.2.0
MAINTAINER Ilya Sizov <sizov.ilya@gmail.com>

# Install apache
RUN apk add --update apache2=2.4.16-r0 apache2-utils=2.4.16-r0 && \
    rm -rf /var/cache/apk/*

# Install php and mysql
RUN apk --update add curl php-apache2 php php-curl php-openssl php-json php-phar php-dom mysql mysql-client php-mysql php-mysqli && rm /var/cache/apk/*

COPY /sites-available/ /etc/apache2/sites-available

COPY httpd.conf /etc/apache2/

RUN mkdir -p /etc/apache2/sites-enabled/
RUN ln -s /etc/apache2/sites-available/default.conf /etc/apache2/sites-enabled/

# Expose the ports for apache
EXPOSE 80

# httpd (pid 1) already running fix
COPY run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh

CMD ["/run-apache.sh"]

#ENTRYPOINT ["httpd", "-D", "FOREGROUND"]

#FROM httpd:2.4
