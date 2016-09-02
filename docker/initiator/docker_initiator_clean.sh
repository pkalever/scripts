#!/bin/bash
. util.sh

run "docker rm bindmount"
run "umount /mnt"

run "multipath -F"
run "iscsiadm -m node -u"
run "lsblk"

