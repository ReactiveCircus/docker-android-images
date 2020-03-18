# docker-android-images

Docker images for Android SDK and Emulators

## Android SDK Image

Downloads the Android SDK and installs build tools and platform tools.

### Image name

`reactivecircus/android-sdk`

### Image version

Image versions (tags) can be found on [Docker Hub](https://hub.docker.com/r/reactivecircus/android-sdk/tags/)

### Current SDK Versions

* Build tools - `29.0.3`
* Platform tools - `29`

### Base image

`ubuntu:bionic`

### Included packages

* `openjdk-8-jdk`
* `curl`
* `zip`
* `unzip`
* `git`
* `openssh-client`

## Android Emulator Images

Downloads and installs packages required for hardware acceleration with **kvm**, and the x86 / x86_64 Android system image for the `<api-level>`.

**Note: host machine must support KVM in order to run accelerated x86 or x86_64 emulators.**

### Image name

`reactivecircus/android-emulator-<api-level>`

### Images and configurations

The following images are available on Docker Hub:

|  | Image on Docker Hub | API level | Target | CPU / ABI |
|---|------------------------------------------------------------------------------------------|-----------|---------|-----------|
|  | [android-emulator-21](https://hub.docker.com/r/reactivecircus/android-emulator-21/tags/) | 21 | default | x86 |
|  | [android-emulator-22](https://hub.docker.com/r/reactivecircus/android-emulator-22/tags/) | 22 | default | x86 |
|  | [android-emulator-23](https://hub.docker.com/r/reactivecircus/android-emulator-23/tags/) | 23 | default | x86 |
|  | [android-emulator-24](https://hub.docker.com/r/reactivecircus/android-emulator-24/tags/) | 24 | default | x86 |
|  | [android-emulator-25](https://hub.docker.com/r/reactivecircus/android-emulator-25/tags/) | 25 | default | x86 |
|  | [android-emulator-26](https://hub.docker.com/r/reactivecircus/android-emulator-26/tags/) | 26 | default | x86 |
|  | [android-emulator-27](https://hub.docker.com/r/reactivecircus/android-emulator-27/tags/) | 27 | default | x86 |
|  | [android-emulator-28](https://hub.docker.com/r/reactivecircus/android-emulator-28/tags/) | 28 | default | x86 |
|  | [android-emulator-29](https://hub.docker.com/r/reactivecircus/android-emulator-29/tags/) | 29 | default | x86 |

### Base image

`reactivecircus/android-sdk:latest`

### Included packages

* `libc++1`

### Notes on running Emulators on CI

Running hardware-accelerated Emulators on cloud-hosted CI has been challenging due to **KVM** being required from the host VM. I wrote about it [here](https://dev.to/ychescale9/running-android-emulators-on-ci-from-bitrise-io-to-github-actions-3j76). The following is a list of changes Google made to help improve this experience.

#### Update 1 (26/02/2019)

The [new emulator 28.1.8 Canary](https://androidstudio.googleblog.com/2019/02/emulator-2818-canary.html) introduced a headless emulator build without KVM dependency which is a blocker for running instrumented tests on most cloud CI services as the host machines usually don't have the required bios settings turned on for KVM. The [android-emulator-28.Dockerfile](android-emulator-28.Dockerfile) has been updated to the canary build for experimenting with this. [Related discussion with the Android Emulator Team on reddit](https://www.reddit.com/r/androiddev/comments/atm3im/emulator_2818_canary/eh6uv01/?context=8&depth=9)

#### Update 2 (17/08/2019)

`emulator-headless` has been released to stable channel for a few months but is still not practically usable in a CI environment with limited memory.

#### Update 3 (02/11/2019)

`emulator-headless` is retired in [Emulator 29.2.7 Canary](https://androidstudio.googleblog.com/2019/11/emulator-2927-canary.html). Headless emulator can be launched with `emulator -no-window`.

### Scheduled release

The `android-emulator-<api-level>` images are automatically re-built and pushed **weekly** to package the latest stable version of the `emulator` SDK component which is updated frequently with improvements and bug fixes.
