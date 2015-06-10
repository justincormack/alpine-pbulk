FROM alpine:latest

MAINTAINER Justin Cormack <justin@specialbusservice.com>

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
  m4

ENV \
  PATH=/usr/pbulk/bin:$PATH \
  NOGCCERROR=yes \
  PKG_DEFAULT_OPTIONS="-gssapi"

RUN \
  cd /usr && \
  git clone https://github.com/jsonn/pkgsrc.git && \
  adduser -D pbulk && \
  mkdir /usr/tmp && \
  cd /usr/pkgsrc/mk/pbulk && LIBABISUFFIX="" sh ./pbulk.sh -n

COPY pbulk.conf /usr/pbulk/etc/
