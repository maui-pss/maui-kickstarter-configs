Kickstarter configuration for Maui
==================================

This is the maui-kickstarter configuration for Maui and requires:

* Mer SDK
* maui-kickstarter >= 0.99.0 installed in Mer SDK
* maui-mic-plugins installed in Mer SDK

To learn how to install the Mer SDK, read the [Mer Wiki](https://wiki.merproject.org/wiki/Platform_SDK).

## Preparation

Enter the Mer Platform SDK and follow the instructions below:

1) Add maui:devel:tools repository:

```sh
sudo zypper ar -G -f http://repo.merproject.org/obs/home:/plfiorini:/maui:/devel:/tools/latest_i486/ maui-tools
```

2) Install the packages:

```sh
sudo zypper install maui-kickstarter maui-mic-plugins
```

2) Clone the git tree:

```sh
git clone https://github.com/mauios/maui-kickstarter-configs.git
cd maui-kickstarter-configs
```

3) Now create kickstarter files:

```sh
maui-kickstarter -e . -c releases/maui-latest-devel.yaml -o maui-ks
```

Steps 1 and 2 must be performed only the first time, step 3 must be performed every time
the kickstarter configuration changes (e.g. git pull picks up changes from the repository).

Step 3 produces kickstart files for the following targets

for Platform SDK:

* maui-x86-sdk: Platform SDK for x86 32-bit systems
* maui-x86_64-sdk: Platform SDK for x86 64-bit systems

for scratchbox2:

* maui-sdk-target-i486: Target for x86 32-bit systems
* maui-sdk-target-armv6l: Target for armv6l systems
* maui-sdk-target-armv7l: Target for armv7l systems
* maui-sdk-target-armv7hl: Target for armv7hl systems
* maui-sdk-target-armv7hl-lge-hammerhead: Target for LG Nexus 5 adaptation development

for OSTree:

* maui-runtime-x86: Runtime tree for x86 32-bit systems
* maui-devel-x86: Development tree for x86 32-bit systems
* maui-runtime-x86_64: Runtime tree for x86 64-bit systems
* maui-devel-x86_64: Development tree for x86 64-bit systems

for virtual machines:

* maui-x86-vm: x86 32-bit virtual machine
* maui-x86_64-vm: x86 64-bit virtual machine

for live medias:

* maui-x86-livecd: x86 32-bit live CD
* maui-x86_64-livecd: x86 64-bit live CD

for hardware adaptations:

* maui-armv6l-brcm-raspberrypi: Raspberry Pi adaptation
* maui-armv7hl-lge-mako: LG Nexus 4 adaptation
* maui-armv7hl-lge-hammerhead: LG Nexus 5 adaptation
* maui-armv7hl-asus-grouper: Asus Nexus 7 2012 WiFi adaptation

Please refer to the single targets documentation to learn more
about their state and whether they are currently enabled or not.

## How to build an image

Just type make followed by the target name, for example if you want to
build maui-x86_64-livecd type the following command:

```sh
make maui-x86_64-livecd
```

## Targets status

The following targets are stable and expected to work:

* maui-x86-livecd
* maui-x86_64-livecd

The following targets are in development, they might be broken sometimes:

* maui-x86-sdk
* maui-armv6l-brcm-raspberrypi
* maui-armv7hl-lge-hammerhead

The following targets are not yet ready and known to be broken:

* maui-x86_64-sdk
* maui-x86-vm
* maui-x86_64-vm
* maui-armv7hl-lge-mako
* maui-armv7hl-asus-grouper

Development on the following targets is suspended:

* maui-runtime-x86
* maui-devel-x86
* maui-runtime-x86_64
* maui-devel-x86_64

## Additional notes on adaptations

### Raspberry Pi

Before building the Raspberry Pi image remember to install a few packages:

```sh
sudo zypper install syslinux-extlinux
```

Once the image is created you can insert a SDCard and write the image to it:

```sh
sudo dd if=maui-ks/maui-armv6l-rpi-mmcblk0p.raw of=/dev/mmcblk0 bs=4M
```

### LG Nexus 5

Before building this adaptation remember to install a few packages:

```
sh
sudo zypper install zip
```
