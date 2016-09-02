#!/usr/bin/env bash

host="10.70.43.78"
ini_name1="iqn.1994-05.com.redhat:kubernetes1"
ini_name2="iqn.1994-05.com.redhat:kubernetes2"
ini_name3="iqn.1994-05.com.redhat:kubernetes3"
iotype="/backstores/user:glfs"

targetcli <<CMD
$iotype create LUN 8G block-store@$host/app-store.img
/iscsi create iqn.2016-08.org.gluster:$host
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/luns create $iotype/LUN 0
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls create $ini_name1
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls create $ini_name2
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls create $ini_name3
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls/$ini_name1 set auth userid=k8s
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls/$ini_name1 set auth password=k8s
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls/$ini_name2 set auth userid=k8s
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls/$ini_name2 set auth password=k8s
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls/$ini_name3 set auth userid=k8s
/iscsi/iqn.2016-08.org.gluster:$host/tpg1/acls/$ini_name3 set auth password=k8s
/ saveconfig
exit
