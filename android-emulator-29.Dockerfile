FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    libc6 libdbus-1-3 libfontconfig1 libgcc1 \
    libpulse0 libtinfo5 libx11-6 libxcb1 libxdamage1 \
    libnss3 libxcomposite1 libxcursor1 libxi6 \
    libxext6 libxfixes3 zlib1g libgl1 pulseaudio socat \
    curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Open ADB port
EXPOSE 5555
EXPOSE 5556

# Install system images
ENV ARCH=x86 \
    TARGET=default \
    EMULATOR_API_LEVEL=29

# API 29 system image
RUN sdkmanager --install "system-images;android-${EMULATOR_API_LEVEL};${TARGET};${ARCH}" \
    "platforms;android-${EMULATOR_API_LEVEL}" \
    "emulator"
