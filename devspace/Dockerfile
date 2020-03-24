FROM alpine:3.11.3

ARG DEVSPACE_VERSION
ARG K8S_VERSION
ARG HELM_VERSION

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl \
    && apk add --update tar gettext gzip \
    && curl -sL https://github.com/devspace-cloud/devspace/releases/$DEVSPACE_VERSION | sed -nE 's!.*"([^"]*devspace-linux-amd64)".*!https://github.com\1!p' | xargs -n 1 curl -L -o /bin/devspace \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
    && apk del --purge deps \
    && rm /var/cache/apk/* \
    && chmod +x /usr/local/bin/kubectl \
    && chmod +x /bin/devspace \
    && helm repo add stable https://kubernetes-charts.storage.googleapis.com \
    && helm repo add bitnami https://charts.bitnami.com/bitnami \
    && helm repo add codecentric https://codecentric.github.io/helm-charts
