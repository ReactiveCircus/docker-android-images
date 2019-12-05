FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
    python-setuptools \
    python-pip \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV ARCH=x86 \
    TARGET=default \
    EMULATOR_API_LEVEL=28

RUN pip install gdown

RUN gdown https://drive.google.com/uc?id=1NX_PeGmDn2OLtIjUes8MdES6O3DUgeq1 \
    && unzip sdk-repo-linux-emulator-full-debug-6031357.zip \
    && mv emulator/ ${ANDROID_HOME}/ \
    && rm sdk-repo-linux-emulator-full-debug-6031357.zip

# API 28 system image
RUN sdkmanager --install "system-images;android-${EMULATOR_API_LEVEL};${TARGET};${ARCH}" \
    "platforms;android-${EMULATOR_API_LEVEL}"
