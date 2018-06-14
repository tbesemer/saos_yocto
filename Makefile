# Root of the container, everything referenced from this.
#
export OS_YOCTO_CONTAINER_ROOT := $(shell pwd)

.PHONY: all
all: os_base os_sdk

.PHONY: os_base
os_base:
	@ bin/do_meta_setup.sh
	@ bin/do_build_config.sh
	@ bin/do_build_base.sh
	@ bin/do_build_objects.sh

.PHONY: os_sdk
os_sdk:
	@ bin/do_meta_setup.sh
	@ bin/do_build_config.sh
	@ bin/do_build_sdk.sh
	@ cp -p meta/poky/build/tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-cortexa9hf-neon-toolchain-2.2.4.sh deploy/poky-glibc-x86_64-core-image-minimal-cortexa9hf-neon-toolchain-2.2.4.sh

clean_os_objects:
	rm -f deploy/*
