FROM ubuntu:16.04

# Install packages
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    openjdk-8-jdk \
    curl \
    unzip \
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre" \
    PATH=$PATH:$JAVA_HOME/bin

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip"
ENV ANDROID_HOME="/usr/local/android-sdk"

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip

# Accept all licenses
RUN yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Android build tools and platform tools
ENV API_LEVEL=29 \
    ANDROID_BUILD_TOOLS_VERSION=29.0.1

RUN touch ~/.android/repositories.cfg
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${API_LEVEL}" \
    "platform-tools"
