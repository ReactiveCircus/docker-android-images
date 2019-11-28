FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV ARCH=x86 \
    TARGET=google_apis \
    API_LEVEL_25=25

# API 25 system image
RUN $ANDROID_HOME/tools/bin/sdkmanager --install "system-images;android-${API_LEVEL_25};${TARGET};${ARCH}" \
    "platforms;android-${API_LEVEL_25}" \
    "emulator"
