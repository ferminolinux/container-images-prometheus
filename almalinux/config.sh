#!/usr/bin/env bash

URL='https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz'
curl -fsSLo prometheus.tar.gz $URL

mkdir prometheus
tar -C prometheus --strip-components 1 -xf prometheus.tar.gz
rm prometheus.tar.gz

