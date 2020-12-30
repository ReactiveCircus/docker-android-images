FROM ubuntu:bionic

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get -qqy --no-install-recommends install \
    openjdk-14-jdk \
    curl \
    zip \
    unzip \
    git \
    locales \
  && rm -rf /var/lib/apt/lists/*

# Use unicode
ENV LANG C.UTF-8

ENV JAVA_HOME="/usr/lib/jvm/java-14-openjdk-amd64/" \
    PATH=$PATH:$JAVA_HOME/bin

ENV ANDROID_SDK_ROOT="/usr/local/android-sdk"
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

ENV CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip"

# Download Android SDK
RUN mkdir "$ANDROID_SDK_ROOT" .android \
    && mkdir -p "$ANDROID_SDK_ROOT/cmdline-tools" \
    && curl -o commandlinetools.zip $CMDLINE_TOOLS_URL \
    && unzip commandlinetools.zip -d "$ANDROID_SDK_ROOT/cmdline-tools" \
    && mv "$ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools" "$ANDROID_SDK_ROOT/cmdline-tools/latest" \
    && rm commandlinetools.zip

# Accept all licenses
RUN yes | sdkmanager --licenses

# Install Android build tools and platform tools
ENV ANDROID_BUILD_TOOLS_VERSION=30.0.3

RUN touch ~/.android/repositories.cfg
RUN sdkmanager --install "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platform-tools"
