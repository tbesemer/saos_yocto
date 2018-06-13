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

MACHINE=`cat $OS_CONTAINER_ROOT/meta/poky/build/conf/local.conf  | sed -n '/MACHINE/p' | sed 's/\"//g' | awk '{print $3}'`

OBJECT_DIR=$OS_CONTAINER_ROOT/meta/poky/build/tmp/deploy/images/$MACHINE

cp -p $OBJECT_DIR/core-image-minimal-$MACHINE.tar.gz  $OS_CONTAINER_ROOT/deploy/rootfs.tar.gz
cp -p $OBJECT_DIR/core-image-minimal-$MACHINE.jffs2  $OS_CONTAINER_ROOT/deploy/rootfs.jffs2

exit 0

