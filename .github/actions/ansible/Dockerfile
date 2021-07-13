FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive
RUN set -e -x; \
    apt-get update; \
    apt-get install -y --no-install-recommends locales \
        git vim python ansible

COPY entrypoint /
CMD [ "/entrypoint" ]
