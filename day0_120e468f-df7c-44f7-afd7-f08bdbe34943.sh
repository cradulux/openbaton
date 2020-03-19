#!/usr/bin/env bash

set -x
 
ulmo_env_file=/usr/local/etc/supercloud/ulmo_env
 
 
source $ulmo_env_file
 
if [ -z "$NRF_URI" ]; then
    NRF_URI="127.0.0.1:29510"
fi

if [ -n "$UDR_IP" ]; then
    # Configure eth1
cat > /etc/netplan/60-data_conf.yaml << EOF
network:
   ethernets:
      eth1:
         dhcp4: false
         addresses: [ ${UDR_IP}/24 ]
EOF

    netplan apply

    
fi
# Extract NRF IP from the URI. Mongodb should be collocated with NRF
NRF_IP=${NRF_URI%:*}
#SRV_IP=$(ifconfig eth1 2>/dev/null|awk '/inet / {print $2}')

cat > /home/tester/go/src/free5gc/config/udrcfg.conf << EOF
info:
  version: 1.0.0
  description: UDR initial local configuration

configuration:
  sbi:
    scheme: https
    ipv4Addr: ${UDR_IP}
    port: 29504
  mongodb:
    name: free5gc
    url: mongodb://${NRF_IP}:27017
  nrfUri: https://${NRF_URI}
EOF

systemctl stop mongodb.service
systemctl disable mongodb.service    
 
 
cd /home/tester/go/src/free5gc
ulimit -n 65535
 
# TODO: create systemd service for udr
nohup ./bin/udr >& /var/log/udr.log &

