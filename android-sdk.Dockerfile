FROM ubuntu:bionic

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    openjdk-8-jdk \
    curl \
    unzip \
    git \
    openssh-client \
  && rm -rf /var/lib/apt/lists/*

# Use unicode
RUN locale-gen C.UTF-8 || true
ENV LANG=C.UTF-8

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/" \
    PATH=$PATH:$JAVA_HOME/bin

ENV CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip"
ENV ANDROID_HOME="/usr/local/android-sdk"

ENV ANDROID_SDK_ROOT=$ANDROID_HOME \
    PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/tools:${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/platform-tools

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && mkdir cmdline-tools \
    && curl -o cmdline-tools/commandlinetools.zip $CMDLINE_TOOLS_URL \
    && unzip cmdline-tools/commandlinetools.zip -d cmdline-tools \
    && rm cmdline-tools/commandlinetools.zip

# Accept all licenses
RUN yes | sdkmanager --licenses

# Install Android build tools and platform tools
ENV API_LEVEL=29 \
    ANDROID_BUILD_TOOLS_VERSION=29.0.3

RUN touch ~/.android/repositories.cfg
RUN sdkmanager --install "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${API_LEVEL}" \
    "platform-tools"
