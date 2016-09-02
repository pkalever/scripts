#!/bin/bash
. util.sh


NODE1="10.70.43.78"
NODE2="10.70.42.60"
NODE3="10.70.42.88"


desc "delete the file"
run "mount -t glusterfs localhost:/block-store /mnt/"
run "rm -rf /mnt/app-store.img"
run "umount /mnt"

desc "stop and delete the volume"
run "gluster vol stop block-store"
run "gluster vol del block-store"

desc "delete pool of storage nodes"
run "gluster peer detach $NODE2"
run "gluster peer detach $NODE3"

desc "list pool"
run "gluster pool list"
