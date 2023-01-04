FROM docker.io/almalinux/8-base

RUN set -eux; \
    # Create dirs
    mkdir /prometheus ; \
    mkdir -p /usr/local/share/prometheus/{consoles,console_libraries} ; \
    mkdir -p /usr/local/etc/prometheus/rules ; \
    
    # Create user and set permissions
    useradd -d /prometheus -M  prometheus ; \

    chown  prometheus:prometheus /prometheus ; \
    chown  -R prometheus:prometheus /usr/local/share/prometheus ; \
    chown -R prometheus:prometheus /usr/local/etc/prometheus ; \

    # Get prometheus
    url='https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz' ; \
    curl -fsSLo /tmp/prometheus.tar.gz $url ; \
    mkdir /tmp/prometheus && \
        tar -C /tmp/prometheus --strip-components 1 -xf /tmp/prometheus.tar.gz ; \
    chown -R prometheus:prometheus /tmp/prometheus ; \
    rm /tmp/prometheus.tar.gz ; \

    # Move prometheus files to dirs
    mv /tmp/prometheus/{prometheus,promtool} /usr/local/bin ; \
    mv /tmp/prometheus/{prometheus.yml,LICENSE,NOTICE} /usr/local/etc/prometheus ; \
    mv /tmp/prometheus/{consoles,console_libraries} /usr/local/share/prometheus ; \

    ln -s /usr/local/share/prometheus/{console_libraries,consoles} /usr/local/etc/prometheus ; 

WORKDIR ["/prometheus"]

VOLUME ["/prometheus"]

EXPOSE 9090

USER prometheus

ENTRYPOINT ["/usr/local/bin/prometheus"]

CMD ["--config.file=/usr/local/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/prometheus", \
     "--web.console.libraries=/usr/local/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/local/share/prometheus/consoles" ]
