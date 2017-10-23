FROM ubuntu:xenial

MAINTAINER https://github.com/jmoffitt/docker-factorio-headless

ENV VERSION=0.15.37

RUN apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install curl pwgen && \
	curl -sSL https://www.factorio.com/get-download/$VERSION/headless/linux64 -o /tmp/factorio_headless_x64_$VERSION.tar.xz && \
	tar xf /tmp/factorio_headless_x64_$VERSION.tar.xz --directory /opt && \
	rm /tmp/factorio_headless_x64_$VERSION.tar.xz && \
	ln -s /factorio/saves /opt/factorio/saves && \
	ln -s /factorio/mods /opt/factorio/mods && \
	apt-get clean && \
	rm -r /var/lib/apt/lists

VOLUME /factorio

EXPOSE 34197/udp 27015/tcp

ADD docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
