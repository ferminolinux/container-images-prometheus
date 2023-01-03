FROM docker.io/almalinux/8-base

RUN set -eux; \
    # Create dirs
    mkdir /prometheus ; \
    mkdir -p /usr/local/share/prometheus/{consoles,console_libraries} ; \
    mkdir /usr/local/etc/prometheus ; \
    mkdir /usr/local/etc/prometheus/rules ; \
    
    useradd -d /prometheus -M  prometheus ; \

    chown  prometheus:prometheus /prometheus ; \
    chown  -R prometheus:prometheus /usr/local/share/prometheus ; \
    chown -R prometheus:prometheus /usr/local/etc/prometheus ;


# COPY binaries
COPY --chown=prometheus:prometheus \
    ./prometheus/prometheus              /usr/local/bin/prometheus
COPY --chown=prometheus:prometheus \
    ./prometheus/promtool                /usr/local/bin/promtool
# COPY license, notice and config-files
COPY --chown=prometheus:prometheus \
    ./prometheus/prometheus.yml          /usr/local/etc/prometheus/prometheus.yml
COPY --chown=prometheus:prometheus \
    ./prometheus/LICENSE                 /usr/local/etc/prometheus/LICENSE
COPY --chown=prometheus:prometheus \
    ./prometheus/NOTICE                  /usr/local/etc/prometheus/NOTICE
# COPY console-dirs
COPY --chown=prometheus:prometheus \
    ./prometheus/consoles/               /usr/local/share/consoles/
COPY --chown=prometheus:prometheus \
    ./prometheus/console_libraries/     /usr/local/share/console_libraries/


RUN ln -s /usr/local/share/prometheus/console_libraries /usr/local/share/prometheus/consoles \
        /usr/local/etc/prometheus

WORKDIR ["/prometheus"]

VOLUME ["/prometheus"]

EXPOSE 9090

USER prometheus

ENTRYPOINT ["/usr/local/bin/prometheus"]

CMD ["--config.file=/usr/local/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/prometheus", \
     "--web.console.libraries=/usr/local/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/local/share/prometheus/consoles" ]
