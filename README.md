Kickstarter configuration for Maui
==================================

This is the mer-kickstarter configuration for Maui and requires:

* Mer SDK
* mer-kickstarter-configs >= 0.3.1 installed in Mer SDK
* mer-kickstarter >= 0.19 installed in Mer SDK

To learn how to install the Mer SDK, read the [Mer Wiki](https://wiki.merproject.org/wiki/Platform_SDK).

## Preparation

1. Enter the Mer Platform SDK and install the required packages:

```sh
sudo zypper install mer-kickstarter mer-kickstarter-configs
```

2. Clone the git tree:

```sh
git clone https://github.com/mauios/maui-kickstarter-configs.git
cd maui-kickstarter-configs
```

3. Now create kickstarter files:

```sh
mer-kickstarter -e . -c releases/maui-latest-devel.yaml -o maui-ks
```

Steps 1 and 2 must be performed only the first time, step 3 must be performed every time
the kickstarter configuration changes (e.g. git pull picks up changes from the repository).

Step 3 produces the following kickstarts:

* maui-runtime-x86.ks: Runtime tree for x86 32-bit systems
* maui-devel-x86.ks: Development tree for x86 32-bit systems
* maui-runtime-x86_64: Runtime tree for x86 64-bit systems
* maui-devel-x86_64: Development tree for x86 64-bit systems

## Building trees for OSTree

Enter the Mer Platform SDK and goes to the maui-kickstarter-configs/maui-ks/ directory.

Choose the OS tree you want to build, in this example we choose `maui-runtime-x86`:

```
sudo mic create auto maui-runtime-x86.ks
```

The following files will be created and are named after the target:

* maui-runtime-x86.tar.gz: compressed tarball to import into OSTree
* maui-runtime-x86.packages: list of packages included by the tree
* maui-runtime-x86-build.log: logs produced by mic
