
KICKSTARTER=maui-kickstarter
KS_DIR=maui-ks
MIC_CREATE=pushd $(KS_DIR); sudo mic create auto $@.ks; popd
CONFIG_FILE=releases/maui-latest-devel.yaml

kickstarts:
	$(KICKSTARTER) -e . -c $(CONFIG_FILE) -o $(KS_DIR)

all: kickstarts

clean:
	@rm -rf $(KS_DIR)

help:
	@echo "Available targets:"
	@echo " - maui-x86-sdk"
	@echo " - maui-x86_64-sdk"
	@echo " - maui-sdk-target-i486"
	@echo " - maui-sdk-target-armv6l"
	@echo " - maui-sdk-target-armv7l"
	@echo " - maui-sdk-target-armv7hl"
	@echo " - maui-x86-vm"
	@echo " - maui-x86_64-vm"
	@echo " - maui-x86-livecd"
	@echo " - maui-x86_64-livecd"
	@echo " - maui-armv6l-brcm-raspberrypi"
	@echo " - maui-armv7hl-lge-mako"
	@echo " - maui-armv7hl-lge-hammerhead"
	@echo " - maui-armv7hl-asus-grouper"

# SDK

maui-x86-sdk: kickstarts
	@$(MIC_CREATE)

maui-x86_64-sdk: kickstarts
	@$(MIC_CREATE)

# SDK targets

maui-sdk-target-i486: kickstarts
	@$(MIC_CREATE)

maui-sdk-target-armv6l: kickstarts
	@$(MIC_CREATE)

maui-sdk-target-armv7l: kickstarts
	@$(MIC_CREATE)

maui-sdk-target-armv7hl: kickstarts
	@$(MIC_CREATE)

# VM

maui-x86-vm: kickstarts
	@$(MIC_CREATE)

maui-x86_64-vm: kickstarts
	@$(MIC_CREATE)

# Live media

maui-x86-livecd: kickstarts
	@$(MIC_CREATE)

maui-x86_64-livecd: kickstarts
	@$(MIC_CREATE)

# Adaptations

maui-armv6l-brcm-raspberrypi: kickstarts
	@$(MIC_CREATE)

maui-armv7hl-lge-mako: kickstarts
	@$(MIC_CREATE)

maui-armv7hl-lge-hammerhead: kickstarts
	@$(MIC_CREATE)

maui-armv7hl-asus-grouper: kickstarts
	@$(MIC_CREATE)

.PHONY: clean build help
