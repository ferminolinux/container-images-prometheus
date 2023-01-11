# Container Images: Prometheus

As imagens estão disponíveis através do [GitHubPackages](https://github.com/fermino-linux/container-images-prometheus/pkgs/container/prometheus) e no [Docker Hub](https://hub.docker.com/r/ferminolinux/prometheus).

Você pode utilizar esta imagem em um container com o comando a seguir:

```bash
docker run --name prometheus -d -p 9090:9090 ferminolinux/prometheus
```

Você pode iniciar o prometheus com um arquivo de configurações personalizado

```bash
docker run  \ 
    --name prometheus \
    -d \
    -p 9090:9090 \
    -v $(pwd)/prometheus.yml:/usr/local/etc/prometheus/prometheus.yml \
    ferminolinux/prometheus
```
