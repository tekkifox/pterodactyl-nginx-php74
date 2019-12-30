FROM webdevops/php:7.4

USER container
ENV USER container
ENV HOME /home/container

WORKDIR /home/container

RUN set -x \
    # Install nginx
    && apt-install \
        nginx git \
    && docker-run-bootstrap \
    && docker-image-cleanup

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

