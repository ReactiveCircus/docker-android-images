FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV PROCESSOR=x86 \
    SYS_IMG=x86 \
    IMG_TYPE=google_apis \
    API_LEVEL_25=25

# API 25 system image
RUN $ANDROID_HOME/tools/bin/sdkmanager --install "system-images;android-${API_LEVEL_25};${IMG_TYPE};${SYS_IMG}" \
    "platforms;android-${API_LEVEL_25}" \
    "emulator"
