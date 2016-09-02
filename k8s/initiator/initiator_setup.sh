#!/bin/bash
. util.sh

NODE1="10.70.43.78"
NODE2="10.70.42.60"
NODE3="10.70.42.88"

run "clear"

desc "enable multipathing"
run "mpathconf --enable"

desc "restart multipathd deamon"
run "systemctl start multipathd"


desc "check everything is okay"
run "mpathconf"



desc "look for block devices"
run "lsblk"

desc "discover and attach the target devices"
desc "Node 1"
run "iscsiadm -m discovery -t st -p ${NODE1} -l"
run "lsblk"
desc "Node2"
run "iscsiadm -m discovery -t st -p ${NODE2} -l"
run "lsblk"
desc "Node3"
run "iscsiadm -m discovery -t st -p ${NODE3} -l"
run "lsblk"
