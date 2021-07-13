FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive
RUN set -e -x; \
    apt-get update; \
    apt-get install -y --no-install-recommends locales \
        python3-pip python3-setuptools python3-wheel \
        git vim

RUN set -e -x; \
    pip3 install vim-vint; \
    git clone https://github.com/syngan/vim-vimlint /tmp/vim-vimlint; \
    git clone https://github.com/ynkdir/vim-vimlparser /tmp/vim-vimlparser

COPY entrypoint /
CMD [ "/entrypoint" ]
