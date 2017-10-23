FROM ubuntu:xenial

MAINTAINER https://github.com/jmoffitt/docker-factorio-headless

ENV VERSION=0.12.35

RUN curl -sSL https://www.factorio.com/get-download/$VERSION/headless/linux64 -o /tmp/factorio_headless_x64_$VERSION.tar.gz && \
	tar xzf /tmp/factorio_headless_x64_$VERSION.tar.gz --directory /opt && \
	rm /tmp/factorio_headless_x64_$VERSION.tar.gz && \
	ln -s /factorio/saves /opt/factorio/saves && \
	ln -s /factorio/mods /opt/factorio/mods

VOLUME /factorio

EXPOSE 34197/udp 27015/tcp

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/docker-entrypoint.sh"]
