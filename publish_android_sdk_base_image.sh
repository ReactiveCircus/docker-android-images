#!/usr/bin/env bash

# generate a new image version from the current time
IMAGE_VERSION=`date "+v%Y_%m_%d-%H-%M-%S"`

# build the docker image with new version and tag
docker build -t reactivecircus/android-sdk-base:latest -t reactivecircus/android-sdk-base:${IMAGE_VERSION}  -f android-sdk-base.Dockerfile .

# publish to Docker Hub
docker push reactivecircus/android-sdk-base:${IMAGE_VERSION}
docker push reactivecircus/android-sdk-base:latest
