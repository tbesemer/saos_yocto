#!/bin/sh

# Sanity check our location.
#
if [ ! -d ${OS_YOCTO_CONTAINER_DEPLOY} ]
then
    echo "Path [${OS_YOCTO_CONTAINER_DEPLOY}] does not seem right, ERROR"
    exit 1
fi

if [ ! -f ${OS_YOCTO_CONTAINER_DEPLOY}/rootfs.tar.gz ]
then
    echo "Source RootFS [${OS_YOCTO_CONTAINER_DEPLOY}/rootfs.tar.gz] does not seem right, ERROR"
    exit 2
fi

TMP_ROOTFS=tmp_rootfs.$$
pushd ${OS_YOCTO_CONTAINER_DEPLOY}
mkdir ${TMP_ROOTFS}
pushd ${TMP_ROOTFS}
tar xf ${OS_YOCTO_CONTAINER_DEPLOY}/rootfs.tar.gz
ln -s /sbin/init init
cp -Rp ${OS_YOCTO_CONTAINER_ROOT}/initramfs_overlay/* .
find . | cpio -H newc -o > ${OS_YOCTO_CONTAINER_DEPLOY}/saos-rootfs.cpio
gzip -f ${OS_YOCTO_CONTAINER_DEPLOY}/saos-rootfs.cpio
popd
rm -rf ${TMP_ROOTFS}
popd

exit 0
