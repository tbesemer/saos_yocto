# Root of the container, everything referenced from this.
#
export OS_CONTAINER_ROOT := $(shell pwd)

.PHONY: all
all: os_base

.PHONY: os_base
os_base:
	@ bin/do_meta_setup.sh
	@ bin/do_build_config.sh
	@ bin/do_build_base.sh

os_objects:
	@ bin/do_build_objects.sh

clean_os_objects:
	rm -f deploy/*
