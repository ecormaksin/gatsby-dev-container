FROM debian:bookworm

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

WORKDIR /root

RUN apt-get -y update && \
    \
    apt-get -y install \
        curl \
        git-all \
        locales \
    && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    \. ~/.bashrc && \
    nvm install --lts && \
    nvm use --lts && \
    npm install -g gatsby-cli

ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
