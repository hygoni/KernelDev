#!/bin/bash

kernel=$1
initrd=$2

if [ -z $kernel ]; then
	echo "pass the kernel argument"
	exit 1
fi

if [ -z $initrd ]; then
	echo "pass the initrd argument"
	exit 1
fi

kvm=(
    qemu-system-x86_64
    -enable-kvm
    -cpu kvm64,+rdtscp
    -kernel $kernel
    -m 300
    -device e1000,netdev=net0
    -netdev user,id=net0
    -boot order=nc
    -no-reboot
    -watchdog i6300esb
    -rtc base=localtime
    -serial stdio
    -vga qxl
    -initrd $initrd
    -spice port=5930,disable-ticketing
    -s
)

append=(
    hung_task_panic=1
    earlyprintk=ttyS0,115200
    systemd.log_level=err
    debug
    apic=debug
    sysrq_always_enabled
    rcupdate.rcu_cpu_stall_timeout=100
    panic=-1
    softlockup_panic=1
    nmi_watchdog=panic
    oops=panic
    load_ramdisk=2
    prompt_ramdisk=0
    console=tty0
    console=ttyS0,115200
    vga=normal
    root=/dev/ram0
    rw
    drbd.minor_count=8
)

"${kvm[@]}" --append "${append[*]}"
