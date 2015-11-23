FROM alpine:latest

MAINTAINER "Mogria <m0gr14@gmail.com>"

RUN mkdir /data
RUN adduser -h /data/www -D -S -G www-data www-data

COPY umask-wrapper.sh /usr/bin/umask-wrapper.sh
RUN chmod +x /usr/bin/umask-wrapper.sh

RUN apk add --update php-cli

VOLUME ["/data"]

USER www-data
WORKDIR /data/www
ENTRYPOINT ["umask-wrapper.sh", "php"]
CMD ["--help"]
