# ArchLinux Bluetooth

Configure bluetooth on Raspberry Pi 4 on ArchLinux

## Install bluetooth protocol stack and firmware

```
yay -S firmware-brcm43xx bluez-utils bluez
```

Add to `/boot/config.txt`

```
dtparam=krnbt=on
```

Enable bluetooth service

```
# systemctl enable bluetooth
```

Reboot, profit!

## Bluetooth audio

Install pulseaudio and bluez packages

```
yay -S pulseaudio-alsa pulseaudio-bluetooth
```

Connect and pair bluetooth speaker/headphones via `bluetootctl`

```
[bluetooth]# power on
[bluetooth]# scan on
...
[bluetooth]# pair AA:AA:AA:AA:AA:AA
[bluetooth]# connect AA:AA:AA:AA:AA:AA
[bluetooth]# trust AA:AA:AA:AA:AA:AA
[bluetooth]# scan off
```

### Pulseaudio auto connect

Add to the end of `/etc/pulse/default.pa`

```
# automatically switch to newly-connected devices
load-module module-switch-on-connect
```

## Power on bluetooth after reboot

Add to `/etc/bluetooth/main.conf`

```
[Policy]
AutoEnable=true
```

## Links

* [Raspberry Pi 4 bluetooth](https://github.com/Arkq/bluez-alsa/issues/205#issuecomment-666250174)
* [Bluetooth audio](https://wiki.archlinux.org/index.php/Bluetooth_headset#Headset_via_Bluez5/PulseAudio)

