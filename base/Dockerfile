# This image is inteded to be base for other docker images in this repo
ARG BASE_ANDROID_SDK_IMAGE

FROM $BASE_ANDROID_SDK_IMAGE

# Should match project flutter version
ARG FLUTTER_VERSION

USER root
RUN apt-get update
RUN apt-get  install -y --no-install-recommends apt-transport-https gpg-agent xvfb x11-utils

# Install dart
RUN sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
RUN sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
RUN apt-get update
RUN apt-get install -y --no-install-recommends dart
ENV HOME="/root"
ENV PATH="/usr/lib/dart/bin:$PATH"

# Install fvm and prepare environment
RUN dart pub global activate fvm
ENV PATH="$HOME/.pub-cache/bin:$PATH"
RUN fvm install ${FLUTTER_VERSION}
RUN fvm global ${FLUTTER_VERSION}
ENV PATH="$HOME/fvm/default/bin:$PATH"
RUN yes | flutter doctor --android-licenses && flutter doctor

# Activate fvm from itself, remove dart isntalled from repo
RUN flutter pub global activate fvm
RUN apt-get remove -y dart

# Add Script to run Xvfb and make it executable
RUN mkdir "/scripts"
COPY ./run-xvfb.sh /scripts/run-xvfb
RUN chmod +x /scripts/run-xvfb
ENV PATH="/scripts/:$PATH"
RUN echo "export PATH=$PATH" > /etc/environment

# Setup env to run Xvfb
ENV DISPLAY=:99
