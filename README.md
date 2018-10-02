# docker-android-images
Docker images for Android SDK and Emulators

## android-sdk.Dockerfile
Downloads the Android SDK and installs build tools and platform tools.

### Image name
ychescale9/android-sdk

### Image version
Image versions (tags) can be found on [Docker Hub](https://hub.docker.com/r/ychescale9/android-sdk/tags/)

### Current SDK Versions
* Build tools - `28.0.3`
* Platform tools - `28`

### Base image
`ubuntu:16.04`

### Included packages
* `openjdk-8-jdk`
* `curl`
* `unzip`

## android-emulator-&lt;api-version&gt;.Dockerfile
Downloads and installs packages required for hardware acceleration with **kvm**, and the Android system image for the `<api-version>`. All system images are `Google APIs Intel x86 Atom`.

**Note: host machine must support hardware acceleration in the BIOS settings in order to run x86 emulators, which is not the case with most of the hosted CI services.**

### Image name
ychescale9/android-emulator-&lt;api-version&gt;

### Image version
Image versions (tags) can be found on Docker Hub:
* [android-emulator-22](https://hub.docker.com/r/ychescale9/android-emulator-22/tags/)
* [android-emulator-23](https://hub.docker.com/r/ychescale9/android-emulator-23/tags/)
* [android-emulator-27](https://hub.docker.com/r/ychescale9/android-emulator-27/tags/)
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
