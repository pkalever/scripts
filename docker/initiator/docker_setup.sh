#!/bin/bash
. util.sh

desc "format the multipathed block device "
run "mkfs.xfs -f /dev/mapper/mpatha"

desc "mount the block device "
run "mount /dev/mapper/mpatha /mnt/"

desc "check if mounted"
run "df -Th"

desc "write some data"
run "touch /mnt/meetp{0..22}"
run "ls /mnt"

desc "run with a bindmount in docker"
run "docker run --name bindmount -v /mnt:/mnt/block-store:z -t -i fedora /bin/bash"


