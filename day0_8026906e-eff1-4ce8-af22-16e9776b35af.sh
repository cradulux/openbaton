#!/usr/bin/env bash

set -x

ulmo_env_file=/usr/local/etc/supercloud/ulmo_env


source $ulmo_env_file

if [ -n "$AMF_IP" ]; then

cat > /etc/netplan/60-data_conf.yaml << EOF
network:
   ethernets:
      eth1:
         dhcp4: false
         addresses: [ ${AMF_IP}/24 ]
EOF

    netplan apply

fi

if [ -z "$NRF_URI" ]; then
    NRF_URI="127.0.0.1:29510"
fi
SRV_IP=$(ifconfig eth1 2>/dev/null|awk '/inet / {print $2}')
SRV_IP=${SRV_IP:-'0.0.0.0'}

cat > /home/tester/go/src/free5gc/config/amfcfg.conf << EOF
info:
  version: 1.0.0
  description: AMF initial local configuration

configuration:
  amfName: AMF
  ngapIpList:
    - 0.0.0.0
  sbi:
    scheme: https
    ipv4Addr: ${SRV_IP}
    port: 29518
  serviceNameList:
    - namf-comm
    - namf-evts
    - namf-mt
    - namf-loc
  servedGuamiList:
    - plmnId:
        mcc: 208
        mnc: 93
      amfId: cafe00
  supportTaiList:
    - plmnId:
        mcc: 208
        mnc: 93
      tac: 1
  plmnSupportList:
    - plmnId:
        mcc: 208
        mnc: 93
      snssaiList:
        - sst: 1
          sd: 010203
        - sst: 1
          sd: 112233
  supportDnnList:
    - internet
  nrfUri: https://${NRF_URI}
  security:
    integrityOrder:
      - NIA2
      - NIA0
    cipheringOrder:
      - NEA2
      - NEA0
  networkName:
    full: free5GC
    short: free
  t3502: 720
  t3512: 3600
  non3gppDeregistrationTimer: 3240
EOF

 systemctl stop mongodb.service
 systemctl disable mongodb.service     


cd /home/tester/go/src/free5gc
ulimit -n 65535

nohup ./bin/amf >& /var/log/amf.log &
