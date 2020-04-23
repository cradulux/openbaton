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

cat > /home/tester/go/src/free5gc/config/nssfcfg.conf << EOF
info:
  version: 1.0.0
  description: NSSF initial local configuration

configuration:
  nssfName: NSSF
  sbi:
    scheme: https
    ipv4Addr: 0.0.0.0
    port: 29531
  serviceNameList:
    - nnssf_nsselection
    - nnssf_nssaiavailability
  nrfUri: https://${NRF_URI}
  supportedPlmnList:
    - mcc: 466
      mnc: 92
  supportedNssaiInPlmnList:
    - plmnId:
        mcc: 466
        mnc: 92
      supportedSnssaiList:
        - sst: 1
          sd: 1
        - sst: 1
          sd: 2
        - sst: 1
          sd: 3
        - sst: 2
          sd: 1
        - sst: 2
          sd: 2
  nsiList:
    - snssai:
        sst: 1
      nsiInformationList:
        - nrfId: http://${NRF_URI}/nnrf-nfm/v1/nf-instances
          nsiId: 10
    - snssai:
        sst: 1
        sd: 1
      nsiInformationList:
        - nrfId: http://${NRF_URI}/nnrf-nfm/v1/nf-instances
          nsiId: 11
    - snssai:
        sst: 1
        sd: 2
      nsiInformationList:
        - nrfId: http://${NRF_URI}/nnrf-nfm/v1/nf-instances
          nsiId: 12
        - nrfId: http://${NRF_URI}/nnrf-nfm/v1/nf-instances
          nsiId: 12
    - snssai:
        sst: 1
        sd: 3
      nsiInformationList:
        - nrfId: http://${NRF_URI}/nnrf-nfm/v1/nf-instances
          nsiId: 13
    - snssai:
        sst: 2
      nsiInformationList:
        - nrfId: http://${NRF_URI}/nnrf-nfm/v1/nf-instances
          nsiId: 20
    - snssai:
        sst: 2
        sd: 1
      nsiInformationList:
        - nrfId: http://${NRF_URI}/nnrf-nfm/v1/nf-instances
          nsiId: 21
  amfSetList:
    - amfSetId: 1
      amfList:
        - ffa2e8d7-3275-49c7-8631-6af1df1d9d26
        - 0e8831c3-6286-4689-ab27-1e2161e15cb1
        - a1fba9ba-2e39-4e22-9c74-f749da571d0d
      nrfAmfSet: http://free5gc-nrf.nctu.me:8081/nnrf-nfm/v1/nf-instances
      supportedNssaiAvailabilityData:
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33456
          supportedSnssaiList:
            - sst: 1
              sd: 1
            - sst: 1
              sd: 2
            - sst: 2
              sd: 1
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33457
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 1
            - sst: 1
              sd: 2
    - amfSetId: 2
      nrfAmfSet: http://free5gc-nrf.nctu.me:8084/nnrf-nfm/v1/nf-instances
      supportedNssaiAvailabilityData:
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33456
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 1
            - sst: 1
              sd: 3
            - sst: 2
              sd: 1
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33458
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 1
            - sst: 2
  amfList:
    - nfId: 469de254-2fe5-4ca0-8381-af3f500af77c
      supportedNssaiAvailabilityData:
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33456
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 2
            - sst: 2
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33457
          supportedSnssaiList:
            - sst: 1
              sd: 1
            - sst: 1
              sd: 2
    - nfId: fbe604a8-27b2-417e-bd7c-8a7be2691f8d
      supportedNssaiAvailabilityData:
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33458
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 1
            - sst: 1
              sd: 3
            - sst: 2
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33459
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 1
            - sst: 2
            - sst: 2
              sd: 1
    - nfId: b9e6e2cb-5ce8-4cb6-9173-a266dd9a2f0c
      supportedNssaiAvailabilityData:
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33456
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 1
            - sst: 1
              sd: 2
            - sst: 2
        - tai:
            plmnId:
              mcc: 466
              mnc: 92
            tac: 33458
          supportedSnssaiList:
            - sst: 1
            - sst: 1
              sd: 1
            - sst: 2
            - sst: 2
              sd: 1
  taList:
    - tai:
        plmnId:
          mcc: 466
          mnc: 92
        tac: 33456
      accessType: 3GPP_ACCESS
      supportedSnssaiList:
        - sst: 1
        - sst: 1
          sd: 1
        - sst: 1
          sd: 2
        - sst: 2
    - tai:
        plmnId:
          mcc: 466
          mnc: 92
        tac: 33457
      accessType: 3GPP_ACCESS
      supportedSnssaiList:
        - sst: 1
        - sst: 1
          sd: 1
        - sst: 1
          sd: 2
        - sst: 2
    - tai:
        plmnId:
          mcc: 466
          mnc: 92
        tac: 33458
      accessType: 3GPP_ACCESS
      supportedSnssaiList:
        - sst: 1
        - sst: 1
          sd: 1
        - sst: 1
          sd: 3
        - sst: 2
      restrictedSnssaiList:
        - homePlmnId:
            mcc: 310
            mnc: 560
          sNssaiList:
            - sst: 1
              sd: 3
    - tai:
        plmnId:
          mcc: 466
          mnc: 92
        tac: 33459
      accessType: 3GPP_ACCESS
      supportedSnssaiList:
        - sst: 1
        - sst: 1
          sd: 1
        - sst: 2
        - sst: 2
          sd: 1
      restrictedSnssaiList:
        - homePlmnId:
            mcc: 310
            mnc: 560
          sNssaiList:
            - sst: 2
              sd: 1
  mappingListFromPlmn:
    - operatorName: NTT Docomo
      homePlmnId:
        mcc: 440
        mnc: 10
      mappingOfSnssai:
        - servingSnssai:
            sst: 1
            sd: 1
          homeSnssai:
            sst: 1
            sd: 1
        - servingSnssai:
            sst: 1
            sd: 2
          homeSnssai:
            sst: 1
            sd: 3
        - servingSnssai:
            sst: 1
            sd: 3
          homeSnssai:
            sst: 1
            sd: 4
        - servingSnssai:
            sst: 2
            sd: 1
          homeSnssai:
            sst: 2
            sd: 2
    - operatorName: AT&T Mobility
      homePlmnId:
        mcc: 310
        mnc: 560
      mappingOfSnssai:
        - servingSnssai:
            sst: 1
            sd: 1
          homeSnssai:
            sst: 1
            sd: 2
        - servingSnssai:
            sst: 1
            sd: 2
          homeSnssai:
            sst: 1
            sd: 3
EOF

systemctl stop mongodb.service
systemctl disable mongodb.service    
 
 
cd /home/tester/go/src/free5gc
ulimit -n 65535
 
# TODO: create systemd service for nssf
nohup ./bin/nssf >& /var/log/nssf.log &

