#!/bin/bash

rm /etc/target/saveconfig.json -rf
systemctl restart target
