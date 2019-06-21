#!/usr/bin/env bash
set -euo pipefail

# generate a new image version from the current time
IMAGE_VERSION=`date "+v%Y_%m_%d-%H-%M-%S"`

# build the docker image with new version and tag
docker build -t ychescale9/android-sdk:latest -t ychescale9/android-sdk:${IMAGE_VERSION}  -f android-sdk.Dockerfile .

# publish to Docker Hub
docker push ychescale9/android-sdk:${IMAGE_VERSION}
docker push ychescale9/android-sdk:latest