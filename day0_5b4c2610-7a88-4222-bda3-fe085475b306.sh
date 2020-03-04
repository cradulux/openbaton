#!/usr/bin/env bash

set -x

cloud_init_ulmo_env_file=/usr/local/etc/supercloud/ulmo_env
source $cloud_init_ulmo_env_file

cat > /home/tester/go/src/free5gc/config/nrfcfg.conf << EOF
info:
  version: 1.0.0
  description: NRF initial local configuration

configuration:
  MongoDBName: "free5gc"
  MongoDBUrl: "mongodb://127.0.0.1:27017"
  DefaultServiceIP: "0.0.0.0"
  sbi:
    scheme: https
    ipv4Addr: 0.0.0.0
    port: 29510
  DefaultPlmnId:
    mcc: "208"
    mnc: "93"
  serviceNameList:
    - nnrf-nfm
    - nnrf-disc
EOF
    
# NRF will also expose MongoDB service
sed -i "s;bind_ip = 127.0.0.1;bind_ip = 0.0.0.0;g" /etc/mongodb.conf
systemctl restart mongodb.service

if [ -n "$NRF_URI" ]; then
    # Extract IP address from URI (of form IP_ADDR:PORT)
    NRF_IP=${NRF_URI%:*}

cat > /etc/netplan/60-data_conf.yaml << EOF
network:
   ethernets:
      eth1:
         dhcp4: false
         addresses: [ ${NRF_IP}/24 ]
EOF

    netplan apply

fi

cd /home/tester/go/src/free5gc
ulimit -n 65535
GOPATH=/home/tester/go
GOROOT=/usr/local/go
PATH=$PATH:$GOPATH/bin:$GOROOT/bin GO111MODULE=off

export GOPATH
export GOROOT
export PATH

nohup ./bin/nrf >& /var/log/nrf.log &
