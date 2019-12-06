FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
    llvm \
  && rm -rf /var/lib/apt/lists/*

RUN ls /usr/bin/llvm-symbolizer*

# Install system images
# ENV ARCH=x86 \
#     TARGET=default \
#     EMULATOR_API_LEVEL=29

# # API 29 system image
# RUN sdkmanager --install "system-images;android-${EMULATOR_API_LEVEL};${TARGET};${ARCH}" \
#     "platforms;android-${EMULATOR_API_LEVEL}" \
#     "emulator"
