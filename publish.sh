#! /bin/bash

TOOL=devspace
K8S_VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/kubernetes/kubernetes/releases/latest | cut -d '/' -f 8)
HELM_VERSION=$(curl -Ls https://github.com/helm/helm/releases | grep "/helm/helm/releases/tag/v3" | head -n 1 | sed 's/[^"]*"\([^"]*\)"[^"]*/\1/g' | cut -d '/' -f 6)
docker build -f $TOOL/Dockerfile --build-arg DEVSPACE_VERSION=latest --build-arg K8S_VERSION=${K8S_VERSION} --build-arg HELM_VERSION=${HELM_VERSION} --tag shopozor/$TOOL $TOOL
docker push shopozor/devspace

TOOL=docker-compose
docker build -f $TOOL/Dockerfile --tag shopozor/$TOOL $TOOL
docker push shopozor/$TOOL

TOOL=pickles
docker build -f $TOOL/Dockerfile --build-arg RELEASE_VERSION=2.20.1 --tag shopozor/$TOOL $TOOL
docker push shopozor/$TOOL

TOOL=python-lint
docker build -f $TOOL/Dockerfile --tag shopozor/$TOOL $TOOL
docker push shopozor/$TOOL

TOOL=cypress
docker build -f $TOOL/Dockerfile --build-arg CYPRESS_VERSION=3.8.3 --tag shopozor/$TOOL $TOOL
docker push shopozor/$TOOL