#!/usr/bin/env bash

set -x
 
ulmo_env_file=/usr/local/etc/supercloud/ulmo_env
 
 
source $ulmo_env_file
 
if [ -z "$AMF_IP" ]; then
    AMF_IP="127.0.0.1"
fi



cat > /home/tester/go/src/free5gc/config/n3iwfcfg.conf << EOF
info:
  version: 1.0.0
  description: N3IWF initial local configuration

configuration:
  N3IWFInformation:
    GlobalN3IWFID:
      PLMNID:
        MCC:
          208
        MNC:
          93
      N3IWFID:
        135
    Name:
      free5GC_N3IWF
    SupportedTAList:
      - TAC:
          1
        BroadcastPLMNList:
          - PLMNID:
              MCC:
                208
              MNC:
                93
            TAISliceSupportList:
              - SNSSAI:
                  SST:
                    1
                  SD:
                    1212
              - SNSSAI:
                  SST:
                    1
                  SD:
                    12233
  AMFAddress:
    - IP: ${AMF_IP}
EOF

systemctl stop mongodb.service
systemctl disable mongodb.service    
 
 
cd /home/tester/go/src/free5gc
ulimit -n 65535
 
# TODO: create systemd service for n3iwf
nohup ./bin/n3iwf >& /var/log/n3iwf.log &

