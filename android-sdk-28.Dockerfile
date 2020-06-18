FROM reactivecircus/android-sdk-base:latest

# Install Android platform
ENV API_LEVEL=28

RUN sdkmanager --install "platforms;android-${API_LEVEL}"
