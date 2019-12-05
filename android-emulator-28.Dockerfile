FROM reactivecircus/android-sdk:latest

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install libc++1 \
    apt-get install -y python-pip \
  && rm -rf /var/lib/apt/lists/*

# Install system images
ENV ARCH=x86 \
    TARGET=default \
    EMULATOR_API_LEVEL=28

RUN gdown https://doc-10-24-docs.googleusercontent.com/docs/securesc/umn156on99sqoohdukugq5nf3q7e08p8/hojlfb9jr0odn0bufejflqjb11hq26jp/1575504000000/10396425233076521357/07249336645993475488/1NX_PeGmDn2OLtIjUes8MdES6O3DUgeq1?e=download&authuser=0&nonce=kn1ehni1v019o&user=07249336645993475488&hash=2pcfh9staai0vhgjq76kh2hon167kan8 -O emulator_debug.zip \
    && unzip emulator_debug.zip \
    && mv emulator/* ${ANDROID_HOME}/emulator/ \
    && rm emulator_debug.zip

# API 28 system image
RUN sdkmanager --install "system-images;android-${EMULATOR_API_LEVEL};${TARGET};${ARCH}" \
    "platforms;android-${EMULATOR_API_LEVEL}"
