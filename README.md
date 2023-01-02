# containers-images-prometheus

Imagem do prometheus para containers

## Descrição

Todas as versões da imagem do prometheus presentes neste repositório possuem um script **config.sh** em seus diretórios, este deverá ser executado antes de iniciar o processo de build da imagem, ele vai obter a versão mais recente do prometheus para que ela possa ser utilizada na criação da imagem.

### config.sh

```bash
#!/usr/bin/env bash

URL='https://github.com/prometheus/prometheus/releases/download/v2.41.0/prometheus-2.41.0.linux-amd64.tar.gz'
curl -fsSLo prometheus.tar.gz $URL

mkdir prometheus
tar -C prometheus --strip-components 1 -xf prometheus.tar.gz
rm prometheus.tar.gz

```

## Tags

No momento a imagem do prometheus, possui as tags:

- [almalinux](almalinux/Dockerfile)
