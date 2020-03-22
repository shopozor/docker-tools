#! /bin/bash

TOOL=devspace
docker build -f $TOOL/Dockerfile --build-arg RELEASE_VERSION=latest --tag shopozor/$TOOL $TOOL
docker push shopozor/devspace

TOOL=docker-compose
docker build -f $TOOL/Dockerfile --tag shopozor/$TOOL $TOOL
docker push shopozor/$TOOL