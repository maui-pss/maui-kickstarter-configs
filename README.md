Kickstarter configuration for Maui
==================================

This is the mer-kickstarter configuration for Maui and requires:

* Mer SDK
* mer-kickstarter-configs >= 0.3.1 installed in Mer SDK
* mer-kickstarter >= 0.19 installed in Mer SDK

To learn how to install the Mer SDK, read the [Mer Wiki](https://wiki.merproject.org/wiki/Platform_SDK).

## Preparation

1) Enter the Mer Platform SDK and install the required packages:

```sh
sudo zypper install mer-kickstarter mer-kickstarter-configs
```

2) Clone the git tree:

```sh
git clone https://github.com/mauios/maui-kickstarter-configs.git
cd maui-kickstarter-configs
```

3) Now create kickstarter files:

```sh
mer-kickstarter -e . -c releases/maui-latest-devel.yaml -o maui-ks
```

Steps 1 and 2 must be performed only the first time, step 3 must be performed every time
the kickstarter configuration changes (e.g. git pull picks up changes from the repository).

Step 3 produces the following kickstarts for OSTree:

* maui-runtime-x86.ks: Runtime tree for x86 32-bit systems
* maui-devel-x86.ks: Development tree for x86 32-bit systems
* maui-runtime-x86_64: Runtime tree for x86 64-bit systems
* maui-devel-x86_64: Development tree for x86 64-bit systems

the following kickstarts for virtual machines:

* maui-x86-vm.ks: x86 32-bit virtual machine
* maui-x86_64-vm.ks: x86 64-bit virtual machine

the following kickstarts for hardware adaptations:

* maui-armv6l-rpi: Raspberry Pi adaptation
* maui-armv7hl-google-nexus7: Google Nexus 7 adaptation

## Building trees for OSTree

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Choose the OS tree you want to build, in this example we choose `maui-runtime-x86`:

```
pushd maui-ks/; sudo mic create auto maui-runtime-x86.ks; popd
```

The following files will be created and are named after the target:

* maui-runtime-x86.tar.gz: compressed tarball to import into OSTree
* maui-runtime-x86.packages: list of packages included by the tree
* maui-runtime-x86-build.log: logs produced by mic

## Building hardware adaptations

### Raspberry Pi

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Before building the Raspberry Pi image remember to install a few packages:

```sh
sudo zypper install syslinux-extlinux
```

Create the image:

```
pushd maui-ks/; sudo mic create auto maui-armv6l-rpi.ks; popd
```

Now you can insert a SDCard and write the image to it:

```sh
sudo dd if=maui-ks/maui-armv6l-rpi-mmcblk0p.raw of=/dev/mmcblk0 bs=4M
```

### Google Nexus 7

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Create the image:

```sh
pushd maui-ks/; sudo mic create auto maui-armv7hl-google-nexus7.ks; popd
```

## Building virtual machines

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/ directory.

Choose the virtual machine you want to build, in this example we choose `maui-x86-vm`:

```
popd maui-ks/; sudo mic create auto maui-x86-vm.ks; popd
```
