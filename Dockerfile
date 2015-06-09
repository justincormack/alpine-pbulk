
FROM alpine:latest

MAINTAINER Justin Cormack

env PATH=/usr/pbulk/bin:$PATH

RUN \
  apk update && \
  apk upgrade && \
  apk add \
  build-base \
  gawk \
  sed \
  zlib-dev \
  openssl-dev \
  ncurses-dev \
  file \
  wget \
  git \
  rsync \
  m4 \
  && \
  wget -q http://ftp.ipv6.uni-leipzig.de/pub/ftp.netbsd.org/pub/pkgsrc/current/pkgsrc.tgz && \
  tar -xzf pkgsrc.tgz -C /usr && \
  adduser -D pbulk && \
  mkdir /usr/tmp && \
  cd /usr/pkgsrc/mk/pbulk && NOGCCERROR=yes LIBABISUFFIX="" sh ./pbulk.sh -n
