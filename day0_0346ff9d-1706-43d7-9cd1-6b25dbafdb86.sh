#!/usr/bin/env bash

set -x

cloud_init_ulmo_env_file=/usr/local/etc/supercloud/ulmo_env

cat > /home/tester/go/src/free5gc/src/upf/build/config/upfcfg.yaml << EOF
info:
  version: 1.0.0
  description: UPF configuration

configuration:
  # debugLevel: panic|fatal|error|warn|info|debug|trace
  debugLevel: info

  pfcp:
    - addr: 127.0.0.8

  gtpu:
    - addr: 127.0.0.8
    # [optional] gtpu.name
    # - name: upf.5gc.nctu.me
    # [optional] gtpu.ifname
    # - ifname: gtpif

  apn_list:
    - apn: internet
      cidr: 60.60.0.0/24
EOF

 systemctl stop mongodb.service
 systemctl disable mongodb.service     

ulimit -n 65535
cd /home/tester/go/src/free5gc
nohup go run webconsole/server.go >& /var/log/web.log &

cd /home/tester/go/src/free5gc/src/upf/build

nohup ./bin/free5gc-upfd >& /var/log/upf.log &
