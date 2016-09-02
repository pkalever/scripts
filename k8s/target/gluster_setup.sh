#!/bin/bash
. util.sh


NODE1="10.70.43.78"
NODE2="10.70.42.60"
NODE3="10.70.42.88"

run "clear"

desc "create new pool of storage nodes"
run "gluster peer probe $NODE2"
run "gluster peer probe $NODE3"

desc "check pool list"
run "gluster pool list"

desc "create a volume"
run "gluster vol create block-store replica 3 ${NODE1}:/brick1 ${NODE2}:/brick2 ${NODE3}:/brick3 force"

desc "start the volume"
run "gluster vol start block-store"

desc "check volume status"
run "gluster vol status"

desc "check volume info"
run "gluster vol info"

desc "lets mount the volume"
run "mount -t glusterfs ${NODE1}:/block-store /mnt"
run "df -Th"

desc "create a big file"
run "fallocate -l 8G /mnt/app-store.img"
run "ls -lh /mnt"

desc "un-mount"
run "umount /mnt"
