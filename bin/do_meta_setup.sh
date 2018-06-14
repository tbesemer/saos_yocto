#!/bin/sh

#  OS_YOCTO_CONTAINER_ROOT must point to the parent git repo that holds
#  everything associated with the OS build.  Typically setup by
#  the Makefile.
#
if [ ! -d $OS_YOCTO_CONTAINER_ROOT/meta ]
then
    echo "Need to be in ~/[os_container], with ~/[os_container]/meta."
    exit 1
fi

git submodule update --init

cd $OS_YOCTO_CONTAINER_ROOT/meta
if [ $? -ne 0 ]
then
    echo "Can't CD into $OS_YOCTO_CONTAINER_ROOT/meta"
    exit 1
fi

cd poky; . ./oe-init-build-env
if [ $? -ne 0 ]
then
    echo "Can't source oe-init-build-env"
    exit 1
fi
 
exit 0
