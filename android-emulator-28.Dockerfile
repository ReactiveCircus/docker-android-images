FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
    llvm \
    python-setuptools \
    python-pip \
    libc6 libdbus-1-3 libfontconfig1 libgcc1 \
    libpulse0 libtinfo5 libx11-6 libxcb1 libxdamage1 \
    libnss3 libxcomposite1 libxcursor1 libxi6 \
    libxext6 libxfixes3 zlib1g libgl1 pulseaudio socat \
    gdb \
    curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
