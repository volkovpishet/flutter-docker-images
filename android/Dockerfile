# This image is inteded to build and run flutter for android target
ARG BASE_IMAGE

FROM $BASE_IMAGE

RUN apt-get update
RUN apt-get  install -y --no-install-recommends ruby-full

# Install tools to be able to run emulator
RUN sdkmanager "platform-tools" "platforms;android-23" "emulator"
RUN sdkmanager "system-images;android-23;default;armeabi-v7a"
RUN echo no | avdmanager create avd -n emuTest -k "system-images;android-23;default;armeabi-v7a"

# build app for the first time (android target) to avoid flutter sdk deps install on every container run
RUN mkdir /temp
WORKDIR /temp
RUN flutter create --project-name temp_project --platforms android -t app temp_project
WORKDIR /temp/temp_project
RUN flutter build apk
WORKDIR /
RUN rm -r /temp

# Add Script to run emulator and make it executable
COPY run-emulator.sh /scripts/run-emulator
RUN chmod +x /scripts/run-emulator
# Add helper for adb
COPY wait-for-emulator.sh /scripts/wait-for-emulator

