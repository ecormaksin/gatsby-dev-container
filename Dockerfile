FROM debian:bookworm

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN apt-get -y update && \
    apt-get -y install \
        curl \
        git-all \
        locales \
        sudo \
    && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    TARGET_USER=gatsby && \
    adduser -q --gecos "" --disabled-login "${TARGET_USER}" && \
    echo "${TARGET_USER}:${TARGET_USER}" | chpasswd && \
    TARGET_USER_SUDOERS="/etc/sudoers.d/${TARGET_USER}" && \
    echo "${TARGET_USER} ALL=(ALL) NOPASSWD: ALL" > "${TARGET_USER_SUDOERS}" && \
    chmod 440 "${TARGET_USER_SUDOERS}"

USER gatsby

WORKDIR /home/gatsby
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    \. ~/.profile && \
    nvm install --lts && \
    nvm use --lts && \
    npm install -g gatsby-cli && \
    tee -a ~/.bashrc <<"EOF" >/dev/null

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF

ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
