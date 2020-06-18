FROM reactivecircus/android-sdk-26:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
    curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Open ADB port
EXPOSE 5555
EXPOSE 5556

# Install system images
ENV ARCH=x86 \
    TARGET=default \
    EMULATOR_API_LEVEL=26

# API 26 system image
RUN sdkmanager --install "system-images;android-${EMULATOR_API_LEVEL};${TARGET};${ARCH}" \
    "platforms;android-${EMULATOR_API_LEVEL}" \
    "emulator"
