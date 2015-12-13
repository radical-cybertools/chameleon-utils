#!/bin/bash

. $HOME/openstack.rc

now=$(date +"%Y%m%d_%H%M")

sudo tar cf /tmp/snapshot.tar / --selinux --acls --xattrs --numeric-owner --one-file-system --exclude=/tmp/* --exclude=/proc/* --exclude=/boot/extlinux

sudo virt-make-fs --format=qcow2 --type=ext4 --label=img-rootfs /tmp/snapshot.tar /tmp/snapshot.qcow2
sudo virt-sysprep -a /tmp/snapshot.qcow2
sudo qemu-img convert /tmp/snapshot.qcow2 -O qcow2 /tmp/snapshot_compressed.qcow2 -c

#glance image-create --name CentOS7-HDP2.3-${now}-snapshot --disk-format qcow2 --container-format bare --property kernel_id=a0aa7bde-c5a3-4180-b64d-0032e2da168e --property ramdisk_id=b39feeff-63f5-44ad-b1ff-7cf70d1a4309 < /tmp/snapshot_compressed.qcow2
