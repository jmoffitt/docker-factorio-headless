FROM ubuntu:xenial

MAINTAINER https://github.com/jmoffitt/docker-factorio-headless

ENV VERSION=0.12.35
ENV SERVNAME=Zuryn1

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install curl
RUN curl -sSL https://www.factorio.com/get-download/$VERSION/headless/linux64 -o /tmp/factorio_headless_x64_$VERSION.tar.gz
RUN tar xzf /tmp/factorio_headless_x64_$VERSION.tar.gz --directory /opt
RUN rm /tmp/factorio_headless_x64_$VERSION.tar.gz
RUN mkdir /factorio
RUN mkdir /factorio/saves
RUN mkdir /factorio/mod
RUN ln -s /factorio/saves /opt/factorio/saves
RUN ln -s /factorio/mods /opt/factorio/mods

VOLUME /factorio

EXPOSE 34197/udp 27015/tcp

ENTRYPOINT ["/opt/factorio/bin/x64/factorio"]
CMD ["--start-server $SERVNAME"]
