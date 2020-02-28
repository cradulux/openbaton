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

cat > /home/tester/go/src/free5gc/config/smfcfg.conf << EOF
info:
  version: 1.0.0
  description: AMF initial local configuration

configuration:
  smfName: SMF
  sbi:
    scheme: https
    ipv4Addr: 0.0.0.0
    port: 29502
    tls:
      key: free5gc/support/TLS/smf.key
      pem: free5gc/support/TLS/smf.pem
  serviceNameList:
    - nsmf-pdusession
    - nsmf-event-exposure
  pfcp:
    addr: 0.0.0.0
  upf:
    - addr: ${UPF_IP}
  ue_subnet: 60.60.0.0/16
  nrfUri: https://${NRF_URI}
EOF

systemctl stop mongodb.service
systemctl disable mongodb.service    
 
 
cd /home/tester/go/src/free5gc
ulimit -n 65535
 
# TODO: create systemd service for smf
nohup ./bin/smf >& /var/log/smf.log &

