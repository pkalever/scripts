#!/bin/bash
. util.sh

run "multipath -F"
run "iscsiadm -m node -u"
run "lsblk"


