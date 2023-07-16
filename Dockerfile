# syntax = docker/dockerfile:1.0-experimental
FROM ubuntu:latest as zwave-update-container
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes
RUN apt-get install -y minicom lrzsz wget nano udev

# From https://github.com/kpine/zwave-js-server-docker/issues/14
COPY ./700firmware.runscript /tmp/
COPY ./CC1352P2_CC2652P_launchpad_coordinator_20230507.hex /tmp/
COPY ./Zooz_ZST10-700_SDK_7.18.3_US.gbl /tmp/

ENTRYPOINT [ "bash" ]

# Instructions: https://github.com/kpine/zwave-js-server-docker/wiki/700-series-Controller-Firmware-Updates-(Linux)
# Manufacturer instructions: https://www.support.getzooz.com/kb/article/931-how-to-perform-an-ota-firmware-update-on-your-zst10-700-z-wave-stick/
