#!/bin/bash
. util.sh

DEVICENAME="36001405f070fa4059634781bd4ceae1f"

run "clear"

desc "format the multipathed block device "
run "mkfs.xfs -f /dev/mapper/${DEVICENAME}"

desc "mount the block device "
run "mount /dev/mapper/${DEVICENAME} /mnt/"

desc "check if mounted"
run "df -Th"

desc "write some data"
run "touch /mnt/k8s{1..14}"
run "ls /mnt"

desc "umount"
run "umount /mnt"

desc "get nodes"
run "kubectl get nodes"

desc "get pods"
run "kubectl get pods"

desc "get pvc"
run "kubectl get pvc"

desc "get pv"
run "kubectl get pv"


desc "create pv"
run "kubectl create -f artifacts/yaml/iscsi-pv.yaml"

desc "check pv"
run "kubectl get pv"

desc "create pvc"
run "kubectl create -f artifacts/yaml/iscsi-pvc.yaml"

desc "check pvc"
run "kubectl get pvc"

desc "create pod"
run "kubectl create -f artifacts/yaml/iscsi-pod.yaml"

desc "check pod"
run "kubectl get pod"

desc "check for events"
run "kubectl get events -w"
