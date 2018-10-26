FROM alpine:3.5

RUN apk --update --no-cache add ca-certificates nginx php7-common

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./nginx /nginx-conf
COPY ./php-fpm /phpfpm-conf

CMD ["/bin/bash", "/entrypoint.sh"]