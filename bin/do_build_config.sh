#!/bin/sh

#  OS_CONTAINER_ROOT must point to the parent git repo that holds
#  everything associated with the OS build.  Typically setup by
#  the Makefile.
#
if [ ! -d $OS_CONTAINER_ROOT/config ]
then
    echo "Need to be in ~/[os_container], with ~/[os_container]/config"
    exit 1
fi

if [ ! -d $OS_CONTAINER_ROOT/meta/poky/build/conf ]
then
    echo "[$OS_CONTAINER_ROOT/meta/poky/build/conf] does not exist"
    exit 1
fi

cat $OS_CONTAINER_ROOT/config/bblayers.conf-template | awk -v rootdir="$OS_CONTAINER_ROOT" '{sub( "__YOCTO__", rootdir ); print }' >  $OS_CONTAINER_ROOT/meta/poky/build/conf/bblayers.conf

cat $OS_CONTAINER_ROOT/config/local.conf-template | awk -v rootdir="$HOME" '{sub( "__HOME__", rootdir ); print }' >  $OS_CONTAINER_ROOT/meta/poky/build/conf/local.conf

exit 0

