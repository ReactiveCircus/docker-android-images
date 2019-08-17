FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV PROCESSOR=x86 \
    SYS_IMG=x86_64 \
    IMG_TYPE=google_apis \
    API_LEVEL_29=29

# Accept all licenses
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# API 29 system image
# TODO remove after Q release
RUN echo "y" | $ANDROID_HOME/tools/bin/sdkmanager --update --channel=3
RUN $ANDROID_HOME/tools/bin/sdkmanager "system-images;android-${API_LEVEL_29};${IMG_TYPE};${SYS_IMG}" \
    "platforms;android-${API_LEVEL_29}" \
    "emulator"
