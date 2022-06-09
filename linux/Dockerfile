# This image is inteded to build and run flutter for linux target
# Note: you need to execute "run-xvfb" before launching app on linux target
ARG BASE_IMAGE

FROM $BASE_IMAGE

ARG ADDIONAL_LUNUX_IMAGE_PACKAGES

RUN apt-get update
RUN apt-get install -y --no-install-recommends cmake ninja-build clang build-essential pkg-config libgtk-3-dev liblzma-dev lcov
RUN flutter config --enable-linux-desktop

RUN apt-get install -y --no-install-recommends ${ADDIONAL_LUNUX_IMAGE_PACKAGES}

# build app for the first time (linux target) to avoid flutter gtk deps install on every container run
RUN mkdir /temp
WORKDIR /temp
RUN flutter create --project-name temp_project --platforms linux -t app temp_project
WORKDIR /temp/temp_project
RUN flutter build linux
WORKDIR /
RUN rm -r /temp
