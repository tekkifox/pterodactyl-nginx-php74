FROM alpine:latest

RUN apk --update --no-cache add ca-certificates nginx php7-common

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]