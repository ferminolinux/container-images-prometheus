FROM docker.io/almalinux/8-base

RUN set -eux; \
    # Create dirs
    mkdir /prometheus ; \
    mkdir -p /usr/local/share/prometheus/{consoles,console_libraries} ; \
    mkdir /usr/local/etc/prometheus ; 

# COPY binaries
COPY --chown=root:root \
    ./prometheus/prometheus              /usr/local/bin/prometheus
COPY --chown=root:root \
    ./prometheus/promtool                /usr/local/bin/promtool
# COPY license, notice and config-files
COPY --chown=root:root \
    ./prometheus/prometheus.yml          /usr/local/etc/prometheus/prometheus.yml
COPY --chown=root:root \
    ./prometheus/LICENSE                 /usr/local/etc/prometheus/LICENSE
COPY --chown=root:root \
    ./prometheus/NOTICE                  /usr/local/etc/prometheus/NOTICE
# COPY console-dirs
COPY --chown=root:root \
    ./prometheus/consoles/               /usr/local/share/consoles/
COPY --chown=root:root \
    ./prometheus/console_libraries/     /usr/local/share/console_libraries/


RUN ln -s /usr/local/share/prometheus/console_libraries /usr/local/share/prometheus/consoles \
        /usr/local/etc/prometheus

WORKDIR ["/prometheus"]

VOLUME ["/prometheus"]

EXPOSE 9090

ENTRYPOINT ["/usr/local/bin/prometheus"]

CMD ["--config.file=/usr/local/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/prometheus", \
     "--web.console.libraries=/usr/local/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/local/share/prometheus/consoles" ]
