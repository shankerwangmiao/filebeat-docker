ARG BEATVERSION=8.13.4
FROM docker.io/elastic/filebeat:$BEATVERSION

USER 0
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends debian-archive-keyring && \
  ln -s /usr/share/keyrings/debian-archive-keyring.gpg /etc/apt/trusted.gpg.d/debian-archive-keyring.gpg && \
  echo "deb http://deb.debian.org/debian buster main" > /etc/apt/sources.list.d/debian-bpo.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends -t buster debian-archive-keyring && \
  echo "deb http://deb.debian.org/debian bullseye-backports main" > /etc/apt/sources.list.d/debian-bpo.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends -t bullseye-backports libsystemd0 && \
  rm -f /etc/apt/sources.list.d/debian-bpo.list && \
  apt-get update && \
  apt-get clean

USER 1000
