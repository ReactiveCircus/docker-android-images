FROM reactivecircus/android-sdk-base:latest

# Install Android platform
ENV API_LEVEL=23

RUN sdkmanager --install "platforms;android-${API_LEVEL}"
