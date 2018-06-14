#!/bin/sh

#  OS_YOCTO_CONTAINER_ROOT must point to the parent git repo that holds
#  everything associated with the OS build.  Typically setup by
#  the Makefile.
#
if [ ! -d $OS_YOCTO_CONTAINER_ROOT/meta/poky/build ]
then
    echo "Need to be in ~/[os_container], with ~/[os_container]/meta/poky/build"
    exit 1
fi

cd $OS_YOCTO_CONTAINER_ROOT/meta/poky/

. ./oe-init-build-env

bitbake core-image-minimal -c populate_sdk
if [ $? -ne 0 ]
then
    echo "bitbake core-image-minimal -c populate_sdk FAILED"
    exit 1
fi

exit 0

