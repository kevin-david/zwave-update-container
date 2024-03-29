# zwave-update-container
Container used to update a 700-series Z-Wave controller's firmware

<a href="https://hub.docker.com/repository/docker/kevinpdavid/zwave-update-container/tags"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/kevinpdavid/zwave-update-container"></a>

Potentially used in conjunction with the [Portainer add-on for HAOS](https://github.com/alexbelgium/hassio-addons/tree/master/portainer) to update a remote or hard-to-reach device, or the [Advanced SSH & Web Terminal](https://github.com/hassio-addons/addon-ssh) addon if you like the docker cli better.

Inspired by https://github.com/kpine/zwave-js-server-docker/wiki/700-series-Controller-Firmware-Updates-(Linux)

## ⚠️ This is now possible via Home Assistant UI
For Z-Wave at least, [this is a whole lot simpler](https://github.com/kpine/zwave-js-server-docker/wiki/700-series-Controller-Firmware-Updates-(Linux)#firmware-update-instructions). 

## Interactive Mode
```console
docker run -it --rm --privileged kevinpdavid/zwave-update-container:main
```

## ZigBee Update

Run as root. Double check `ttyUSB` first:

```console
ls -la /dev/serial/by-id/usb-*
```

Then run the actual update:

```console
docker run --rm --device /dev/ttyUSB1:/dev/ttyUSB1 -e FIRMWARE_URL=https://raw.githubusercontent.com/kevin-david/zwave-update-container/main/CC1352P2_CC2652P_launchpad_coordinator_20230507.hex ckware/ti-cc-tool -ewv -p /dev/ttyUSB1 --bootloader-sonoff-usb
```

Credit: 
- https://github.com/git-developer/ti-cc-tool/ (which doesn't work properly downloading files on HAOS) 

## Debugging
https://github.com/kpine/zwave-js-server-docker/wiki/USB-Reset
