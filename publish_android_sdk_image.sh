#!/usr/bin/env bash

# API level passed in as argument
API=$1

# generate a new image version from the current time
IMAGE_VERSION=`date "+v%Y_%m_%d-%H-%M-%S"`

# build the docker image with new version and tag
docker build -t reactivecircus/android-sdk-${API}:latest -t reactivecircus/android-sdk-${API}:${IMAGE_VERSION}  -f android-sdk-${API}.Dockerfile .

# publish to Docker Hub
docker push reactivecircus/android-sdk-${API}:${IMAGE_VERSION}
docker push reactivecircus/android-sdk-${API}:latest
