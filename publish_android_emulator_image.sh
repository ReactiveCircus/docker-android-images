#!/usr/bin/env bash
set -euo pipefail

# API level passed in as argument
API=$1

# generate a new image version from the current time
IMAGE_VERSION=`date "+v%Y_%m_%d-%H-%M-%S"`

# build the docker image with new version and tag
docker build -t reactivecircus/android-emulator-${API}:latest -t reactivecircus/android-emulator-${API}:${IMAGE_VERSION}  -f android-emulator-${API}.Dockerfile .

# publish to Docker Hub
docker push reactivecircus/android-emulator-${API}:${IMAGE_VERSION}
docker push reactivecircus/android-emulator-${API}:latest
