FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV ARCH=x86_64 \
    TARGET=google_apis \
    API_LEVEL_28=28

# API 28 system image
RUN sdkmanager --install "system-images;android-${API_LEVEL_28};${TARGET};${ARCH}" \
    "platforms;android-${API_LEVEL_28}" \
    "emulator"
