#!/usr/bin/env bash

set -x
 
ulmo_env_file=/usr/local/etc/supercloud/ulmo_env
 
 
source $ulmo_env_file
 
if [ -z "$NRF_URI" ]; then
    NRF_URI="127.0.0.1:29510"
fi

if [ -z "$UDR_IP" ]; then
    UDR_IP="127.0.0.1"
fi

SRV_IP=$(ifconfig eth1 2>/dev/null|awk '/inet / {print $2}')
SRV_IP=${SRV_IP:-"0.0.0.0"}
# Extract NRF IP from the URI. Mongodb should be collocated with NRF
NRF_IP=${NRF_URI%:*}
NRF_PORT=${NRF_URI#*:}

cat > /home/tester/go/src/free5gc/config/udmcfg.conf << EOF
info:
  version: 1.0.0
  description: UDM initial local configuration

configuration:
  serviceNameList:
    - nudm-sdm
    - nudm-uecm
    - nudm-ueau
    - nudm-ee
    - nudm-pp
  sbi:
    scheme: https
    ipv4Addr: ${SRV_IP}
    port: 29503
    tls:
      log: free5gc/udmsslkey.log
      pem: free5gc/support/TLS/udm.pem
      key: free5gc/support/TLS/udm.key
  
  udrclient:
    scheme: https
    ipv4Adrr: ${UDR_IP}
    port: 29504

  nrfclient:
    scheme: https
    ipv4Adrr: ${NRF_IP}
    port: ${NRF_PORT}
EOF

systemctl stop mongodb.service
systemctl disable mongodb.service    
 
 
cd /home/tester/go/src/free5gc
ulimit -n 65535
 
# TODO: create systemd service for udm
nohup ./bin/udm >& /var/log/udm.log &

