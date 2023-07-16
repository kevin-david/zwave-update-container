# zwave-update-container
Container used to update a 700-series Z-Wave controller's firmware

![Docker Pulls](https://img.shields.io/docker/pulls/kevinpdavid/zwave-update-container?link=https%3A%2F%2Fhub.docker.com%2Frepository%2Fdocker%2Fkevinpdavid%2Fzwave-update-container%2Ftags)

Potentially used in conjunction with the [Portainer add-on for HAOS](https://github.com/alexbelgium/hassio-addons/tree/master/portainer) to update a remote or hard-to-reach device.

Inspired by https://github.com/kpine/zwave-js-server-docker/wiki/700-series-Controller-Firmware-Updates-(Linux)

## ZigBee Update

Run:

```
docker run --rm --device /dev/ttyUSB1:/dev/ttyUSB1 -e FIRMWARE_URL=https://raw.githubusercontent.com/kevin-david/zwave-update-container/main/CC1352P2_CC2652P_launchpad_coordinator_20220928.hex ckware/ti-cc-tool -ewv -p /dev/ttyUSB1 --bootloader-sonoff-usb
```

Credit: 
- https://github.com/git-developer/ti-cc-tool/ (which doesn't work properly downloading files on HAOS) 

## Debugging
https://github.com/kpine/zwave-js-server-docker/wiki/USB-Reset
