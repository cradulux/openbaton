#!/usr/bin/env bash

set -x

cloud_init_ulmo_env_file=/usr/local/etc/supercloud/ulmo_env

. $cloud_init_ulmo_env_file

SRV_IP=$(ifconfig eth1 2>/dev/null|awk '/inet / {print $2}')
SRV_IP=${SRV_IP:-'0.0.0.0'}

cat > /home/tester/go/src/free5gc/config/pcfcfg.conf << EOF
info:
  version: 1.0.0
  description: PCF initial local configuration
configuration:
  pcfName: PCF
  sbi:
     scheme: https
     ipv4Addr: ${SRV_IP}
     port: 29507
  timeFormat: 2019-01-02 15:04:05
  defaultBdtRefId: BdtPolicyId-
  nrfUri: https://${NRF_IP}:29510
  serviceNameList:
     - npcf-am-policy-control
     - npcf-smpolicycontrol
     - npcf-bdtpolicycontrol
     - npcf-bdtpolicycontrol
     - npcf-eventexposure
     - npcf-ue-policy-control

EOF

systemctl stop mongodb.service
systemctl disable mongodb.service

cd /home/tester/go/src/free5gc
ulimit -n 65535

set -a
GOPATH=/home/tester/go
GOROOT=/usr/local/go
PATH=$PATH:$GOPATH/bin:$GOROOT/bin 
GO111MODULE=off 
set +a

nohup ./bin/pcf >& /var/log/pcf.log &


