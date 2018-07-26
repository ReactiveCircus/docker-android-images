# docker-android-images
Docker images for Android SDK and Emulators

## android-sdk.Dockerfile
Downloads the Android SDK and installs build tools and platform tools.

### Image name
ychescale9/android-sdk

### Image version
Image versions (tags) can be found on [Docker Hub](https://hub.docker.com/r/ychescale9/android-sdk/tags/)

### Current SDK Versions
* Build tools - `28.0.1`
* Platform tools - `28`

### Base image
`ubuntu:16.04`

### Included packages
* `openjdk-8-jdk`
* `curl`
* `unzip`

## android-emulator-<api-version>.Dockerfile
Downloads and installs packages required for hardware acceleration with *kvm*, and the Android system image for the `<api-version>`. All system images are `Google APIs Intel x86 Atom`.

### Image name
ychescale9/android-emulator-<api-version>

### Image version
Image versions (tags) can be found on Docker Hub:
* [android-emulator-22](https://hub.docker.com/r/ychescale9/android-emulator-22/tags/)
* [android-emulator-28](https://hub.docker.com/r/ychescale9/android-emulator-28/tags/)

### Base image
`ychescale9/android-sdk:<latest-image-version>`

### Included packages
* `qemu-kvm`
* `libvirt-bin`
* `ubuntu-vm-builder`
* `bridge-utils`
* `virtinst`
* `cpu-checker`
* `lib32stdc++6`
