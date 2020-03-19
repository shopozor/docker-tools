#! /bin/bash

docker build -f devspace/Dockerfile --build-arg RELEASE_VERSION=latest --tag shopozor/devspace
docker push shopozor/devspace