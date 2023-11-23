FROM node:21.2.0

RUN apt-get -y update && \
    apt-get -y install locales && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 \
    npm install -g gatsby-cli

ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
