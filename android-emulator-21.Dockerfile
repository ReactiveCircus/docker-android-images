FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV ARCH=x86 \
    TARGET=google_apis \
    API_LEVEL_21=21

# API 21 system image
RUN sdkmanager --install "system-images;android-${API_LEVEL_21};${TARGET};${ARCH}" \
    "platforms;android-${API_LEVEL_21}" \
    "emulator"
