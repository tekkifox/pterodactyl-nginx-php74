FROM ubuntu:latest

    # Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8


RUN apt update \
    && apt upgrade -y \
    && apt -y install curl software-properties-common locales git \
    && useradd -d /home/container -m container
    
RUN locale-gen en_US.UTF-8

RUN add-apt-repository -y ppa:ondrej/php \
    && apt update \
    && apt -y install php7.2 php7.2-cli php7.2-gd php7.2-mysql php7.2-pdo php7.2-mbstring php7.2-tokenizer php7.2-bcmath php7.2-xml php7.2-fpm php7.2-curl php7.2-zip


USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

#COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/echo", "Hello World"]