#!/usr/bin/env bash

set -x
 
ulmo_env_file=/usr/local/etc/supercloud/ulmo_env
 
 
source $ulmo_env_file
 
if [ -z "$NRF_URI" ]; then
    NRF_URI="127.0.0.1:29510"
fi

# PFCP and UPF exposed by UPF function
if [ -z "$UPF_IP" ]; then
    UPF_IP="127.0.0.8" 
fi

cat > /home/tester/go/src/free5gc/config/ausfcfg.conf << EOF
info:
  version: 1.0.0
  description: AUSF initial local configuration

configuration:
  sbi:
    scheme: https
    ipv4Addr: 0.0.0.0
    port: 29509
  serviceNameList:
    - nausf-auth
  nrfUri: https://${NRF_URI}
  plmnSupportList:
    - mcc: 208
      mnc: 93
    - mcc: 123
      mnc: 45
  groupId: ausfGroup001
EOF

systemctl stop mongodb.service
systemctl disable mongodb.service    
 
 
cd /home/tester/go/src/free5gc
ulimit -n 65535
 
# TODO: create systemd service for ausf
nohup ./bin/ausf >& /var/log/ausf.log &

