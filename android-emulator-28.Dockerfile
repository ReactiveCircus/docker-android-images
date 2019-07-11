FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV PROCESSOR=x86 \
    SYS_IMG=x86 \
    IMG_TYPE=google_apis \
    API_LEVEL_28=28

# API 28 system image
# TODO testing new canary version without QT dependency, remove once available in stable channel
RUN echo "y" | $ANDROID_HOME/tools/bin/sdkmanager --update --channel=3
RUN echo "y" | $ANDROID_HOME/tools/bin/sdkmanager "system-images;android-${API_LEVEL_28};${IMG_TYPE};${SYS_IMG}" \
    "platforms;android-${API_LEVEL_28}" \
    "emulator"
