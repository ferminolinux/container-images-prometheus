FROM docker.io/alpine:latest

RUN set -eux; \
    # Create dirs
    mkdir /prometheus ; \
    mkdir -p /usr/local/share/prometheus/{consoles,console_libraries} ; \
    mkdir -p /etc/prometheus/rules ; \
    
    # Create user and set permissions
    adduser -h /prometheus -HD  prometheus ; \

    chown  prometheus:prometheus /prometheus ; \
    chown  -R prometheus:prometheus /usr/local/share/prometheus ; \
    chown -R prometheus:prometheus /etc/prometheus ; \

    # Get prometheus
    url='https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz' ; \
    wget -qO /tmp/prometheus.tar.gz $url ; \
    mkdir /tmp/prometheus && \
        tar -C /tmp/prometheus --strip-components 1 -xf /tmp/prometheus.tar.gz ; \
    chown -R prometheus:prometheus /tmp/prometheus ; \
    rm /tmp/prometheus.tar.gz ; \

    # Move prometheus files to dirs
    mv /tmp/prometheus/prometheus /usr/bin ; \
    mv /tmp/prometheus/promtool /usr/bin ; \ 
    
    mv /tmp/prometheus/prometheus.yml /etc/prometheus ; \
    mv /tmp/prometheus/LICENSE /etc/prometheus ; \
    mv /tmp/prometheus/NOTICE /etc/prometheus ; \

    mv /tmp/prometheus/consoles /usr/local/share/prometheus ; \
    mv /tmp/prometheus/console_libraries /usr/local/share/prometheus ; \

    ln -s \
        /usr/local/share/prometheus/console_libraries \
        /usr/local/share/prometheus/consoles /etc/prometheus 

WORKDIR ["/prometheus"]

VOLUME ["/prometheus"]

EXPOSE 9090

USER prometheus

ENTRYPOINT ["/usr/bin/prometheus"]

CMD ["--config.file=/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/prometheus", \
     "--web.console.libraries=/usr/local/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/local/share/prometheus/consoles" ]
