# syntax = docker/dockerfile:1.0-experimental
FROM ubuntu:latest as zwave-update-container
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes
RUN apt-get install -y minicom lrzsz wget nano udev

# From https://github.com/kpine/zwave-js-server-docker/issues/14
COPY ./700firmware.runscript /tmp/
RUN wget -O /tmp/ZW_SerialAPI_Controller_7_17_2_406_ZGM130S_REGION_US.gbl https://github.com/SiliconLabs/gecko_sdk/raw/gsdk_4.0/protocol/z-wave/Apps/bin/gbl/ZW_SerialAPI_Controller_7_17_2_406_ZGM130S_REGION_US.gbl

ENTRYPOINT [ "bash" ]

# Instructions: https://github.com/kpine/zwave-js-server-docker/wiki/700-series-Controller-Firmware-Updates-(Linux)
# Manufacturer instructions: https://www.support.getzooz.com/kb/article/931-how-to-perform-an-ota-firmware-update-on-your-zst10-700-z-wave-stick/
