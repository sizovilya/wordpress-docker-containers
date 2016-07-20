FROM alpine:latest
MAINTAINER Ilya Sizov <sizov.ilya@gmail.com>

WORKDIR /app

COPY startup.sh /startup.sh

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD ["/startup.sh"]