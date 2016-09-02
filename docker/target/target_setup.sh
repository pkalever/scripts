#!/usr/bin/env bash

host="10.70.41.153"
ini_name="iqn.1994-05.com.redhat:docker"

targetcli <<CMD
/backstores/user:glfs create glfsLUN 8G block-store@${host}/app-store.img
/iscsi create iqn.2016-08.org.gluster:${host}
/iscsi/iqn.2016-08.org.gluster:${host}/tpg1/luns create /backstores/user:glfs/glfsLUN 0
/iscsi/iqn.2016-08.org.gluster:${host}/tpg1/acls create ${ini_name}
/iscsi/iqn.2016-08.org.gluster:${host}/tpg1/acls/${ini_name} set auth userid=docker
/iscsi/iqn.2016-08.org.gluster:${host}/tpg1/acls/${ini_name} set auth password=docker
/ saveconfig
exit
