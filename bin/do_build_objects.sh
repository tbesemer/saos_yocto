#!/bin/sh

#  OS_YOCTO_CONTAINER_ROOT must point to the parent git repo that holds
#  everything associated with the OS build.  Typically setup by
#  the Makefile.
#
if [ ! -d $OS_YOCTO_CONTAINER_ROOT/config ]
then
    echo "Need to be in ~/[os_container], with ~/[os_container]/config"
    exit 1
fi

if [ ! -d $OS_YOCTO_CONTAINER_ROOT/meta/poky/build/conf ]
then
    echo "[$OS_YOCTO_CONTAINER_ROOT/meta/poky/build/conf] does not exist"
    exit 1
fi

MACHINE=`cat $OS_YOCTO_CONTAINER_ROOT/meta/poky/build/conf/local.conf  | sed -n '/MACHINE/p' | sed 's/\"//g' | awk '{print $3}'`

OBJECT_DIR=$OS_YOCTO_CONTAINER_ROOT/meta/poky/build/tmp/deploy/images/$MACHINE

cp -p $OBJECT_DIR/core-image-minimal-$MACHINE.tar.gz  $OS_YOCTO_CONTAINER_ROOT/deploy/rootfs.tar.gz
cp -p $OBJECT_DIR/core-image-minimal-$MACHINE.jffs2  $OS_YOCTO_CONTAINER_ROOT/deploy/rootfs.jffs2
cp -p $OBJECT_DIR/core-image-minimal-$MACHINE.cpio.gz.u-boot  $OS_YOCTO_CONTAINER_ROOT/deploy/rootfs.cpio.gz.u-boot
cp -p $OBJECT_DIR/core-image-minimal-$MACHINE.cpio.gz  $OS_YOCTO_CONTAINER_ROOT/deploy/rootfs.cpio.gz

exit 0

