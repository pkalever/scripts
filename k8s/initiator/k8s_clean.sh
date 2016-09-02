#!/bin/bash
. util.sh

desc "delete pod"
run "kubectl delete -f artifacts/yaml/iscsi-pod.yaml"

desc "delet pvc"
run "kubectl delete -f artifacts/yaml/iscsi-pvc.yaml"

desc "delet pv"
run "kubectl delete -f artifacts/yaml/iscsi-pv.yaml"

desc "check pv"
run "kubectl get pv"

desc "check pvc"
run "kubectl get pvc"

desc "check pod"
run "kubectl get pod"

run "multipath -F"
run "iscsiadm -m node -u"
run "lsblk"


