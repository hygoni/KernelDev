#!/bin/bash

if [ 1 -gt $# ]
then
	echo "No version found."
	echo "Usage: $0 v_1, v_2, v_i, ..., v_n"
	echo "v_i is version to remove"
	exit
elif [ `whoami` != 'root' ]
then
	echo "You must run this in root"
	exit
fi

for version in "$@"
do
	rm /boot/vmlinuz-$version
	rm /boot/initrd.img-$version
	rm /boot/System.map-$version
	rm /boot/config-$version
	rm -rf /lib/modules/$version
	rm -rf /var/lib/initramfs/$version
done

update-grub2
