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

Step 3 produces the following kickstarts

for Platform SDK:

* maui-x86-sdk.ks: Platform SDK for x86 32-bit systems
* maui-x86_64-sdk.ks: Platform SDK for x86 64-bit systems

for OSTree:

* maui-runtime-x86.ks: Runtime tree for x86 32-bit systems
* maui-devel-x86.ks: Development tree for x86 32-bit systems
* maui-runtime-x86_64: Runtime tree for x86 64-bit systems
* maui-devel-x86_64: Development tree for x86 64-bit systems

for virtual machines:

* maui-x86-vm.ks: x86 32-bit virtual machine
* maui-x86_64-vm.ks: x86 64-bit virtual machine

for live medias:

* maui-x86-livecd.ks: x86 32-bit live CD
* maui-x86_64-livecd.ks: x86 64-bit live CD

for hardware adaptations:

* maui-armv6l-brcm-raspberrypi: Raspberry Pi adaptation
* maui-armv7hl-lge-mako: LG Nexus 4 adaptation
* maui-armv7hl-lge-hammerhead: LG Nexus 5 adaptation
* maui-armv7hl-asus-grouper: Asus Nexus 7 2012 WiFi adaptation

Please refer to the single targets documentation to learn more
about their state and whether they are currently enabled or not.

## Building the Platform SDK

**WARNING:** Only maui-x86-sdk.ks is currently enabled.

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Choose the target you want to build, in this example we choose `maui-x86-sdk`:

```sh
pushd maui-ks/; sudo mic create auto maui-x86-sdk.ks; popd
```

## Building trees for OSTree

**WARNING:** Currently disabled.

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Choose the OS tree you want to build, in this example we choose `maui-runtime-x86`:

```sh
pushd maui-ks/; sudo mic create auto maui-runtime-x86.ks; popd
```

The following files will be created and are named after the target:

* maui-runtime-x86.tar.gz: compressed tarball to import into OSTree
* maui-runtime-x86.packages: list of packages included by the tree
* maui-runtime-x86-build.log: logs produced by mic

## Building hardware adaptations

## Virtual machines

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Choose the virtual machine you want to build, in this example we choose `maui-x86-vm`:

```sh
pushd maui-ks/; sudo mic create auto maui-x86-vm.ks; popd
```

## Live medias

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Choose the target you want to build, in this example we choose `maui-x86-livecd`:

```sh
pushd maui-ks/; sudo mic create auto maui-x86-livecd.ks; popd
```

### Raspberry Pi

**WARNING:** Currently in development.

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Before building the Raspberry Pi image remember to install a few packages:

```sh
sudo zypper install syslinux-extlinux
```

Create the image:

```sh
pushd maui-ks/; sudo mic create auto maui-armv6l-brcm-raspberrypi.ks; popd
```

Now you can insert a SDCard and write the image to it:

```sh
sudo dd if=maui-ks/maui-armv6l-rpi-mmcblk0p.raw of=/dev/mmcblk0 bs=4M
```

### LG Nexus 4

**WARNING:** Not yet supported.

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Create the image:

```sh
pushd maui-ks/; sudo mic create auto maui-armv7hl-lge-mako.ks; popd
```

### LG Nexus 5

**WARNING:** Currently in development.

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Create the image:

```sh
pushd maui-ks/; sudo mic create auto maui-armv7hl-lge-hammerhead.ks; popd
```

### Asus Nexus 7 2012 WiFi

**WARNING:** Not yet supported.

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Create the image:

```sh
pushd maui-ks/; sudo mic create auto maui-armv7hl-asus-grouper.ks; popd
```
