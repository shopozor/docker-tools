FROM alpine/helm:3.1.2

ARG RELEASE_VERSION=latest

RUN apk add curl tar \
    && curl -s -L "https://github.com/devspace-cloud/devspace/releases/$RELEASE_VERSION" | sed -nE 's!.*"([^"]*devspace-linux-amd64)".*!https://github.com\1!p' | xargs -n 1 curl -L -o /bin/devspace \
    && chmod +x /bin/devspace \
    && helm repo add stable https://kubernetes-charts.storage.googleapis.com \
    && helm repo add bitnami https://charts.bitnami.com/bitnami \
    && helm repo add codecentric https://codecentric.github.io/helm-charts
