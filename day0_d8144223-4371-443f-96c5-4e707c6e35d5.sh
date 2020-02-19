#cloud-config
groups:
  - users
system_info:
 default_user:
  name: ubuntu
  lock_passwd: true
  groups: users
 sudo: ["ALL=(ALL) NOPASSWD:ALL"]
password: ubuntu
chpasswd: { expire: False }
ssh_pwauth: True

ca-certs:
  trusted:
  - |
    -----BEGIN CERTIFICATE-----
    MIIEqjCCA5KgAwIBAgIKHsJTwgAAAAAAEjANBgkqhkiG9w0BAQsFADCBhDELMAkG
    A1UEBhMCUlUxDzANBgNVBAgTBk1vc2NvdzEPMA0GA1UEBxMGTW9zY293MSIwIAYD
    VQQKExknTHV4b2Z0IFByb2Zlc3Npb25hbCcgTExDMRYwFAYDVQQLEw1JVCBEZXBh
    cnRtZW50MRcwFQYDVQQDEw5MdXhvZnQgUm9vdCBDQTAeFw0xNjA4MjQwODI1NTNa
    Fw0yMjA4MTcwNTI2MjNaMIGMMQswCQYDVQQGEwJSTzESMBAGA1UECBMJQnVjaGFy
    ZXN0MRIwEAYDVQQHEwlCdWNoYXJlc3QxHDAaBgNVBAoTE0x1eG9mdCBQcm9mZXNz
    aW9uYWwxFjAUBgNVBAsTDUlUIERlcGFydG1lbnQxHzAdBgNVBAMTFkx1eG9mdCBJ
    c3N1aW5nIENBIC0gRzIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD
    Zs/0LPREEvXW+Uq4Od9VAGSKPR0L8TUcuUjWROjlqVzB3sr5TaGoRiIe87+d0GOI
    jVcopwqRMoOrIvOpSsj7vhOpIVIffyiODJBG1CH0H8TvFHyjbT+EKRDCmwOuyBql
    trv4J3Y92HdnHAyyGaVuh69TxQMsyCw7oWSts1MzsrzUZaDIrhgRsKDA+8EMOtF5
    BG/0aWX/QJVbmT6eWxftACQM72uhUTtKgx6GLlI8raEF1CiRuR3fIjKVt8gs7Mq9
    3ItkZdO+YTlTK4lvpUhT8V51vkspwwXy0fgxf8o3nWHW7hKMnBBnsR2vY5zmnpMC
    wu0FAQ9mb8SBxGf8Ha0/AgMBAAGjggESMIIBDjAQBgkrBgEEAYI3FQEEAwIBADAd
    BgNVHQ4EFgQULmS2KCDJ6XIg41eOgac7VniZQFUwGQYJKwYBBAGCNxQCBAweCgBT
    AHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgw
    FoAUz5Jbd2y1D2hHvWZThypojru75/owOgYDVR0fBDMwMTAvoC2gK4YpaHR0cDov
    L2NlcnQubHV4b2Z0LmNvbS9MdXhvZnQtUm9vdC1DQS5jcmwwRQYIKwYBBQUHAQEE
    OTA3MDUGCCsGAQUFBzAChilodHRwOi8vY2VydC5sdXhvZnQuY29tL0x1eG9mdC1S
    b290LUNBLmNydDANBgkqhkiG9w0BAQsFAAOCAQEAlFvQoFJ9sZ54K8CRz8L2zbuW
    NwZdibJwBiLo00/NMrTfIgb19D52rbQIad7Ct+tjR+ZWG6O3ZIVJtEmsL2z1mYae
    e0ofp/EVJrKl+SWAPUsrEV/8Vqb9zhcCMmRCEmSMxKT4m0oJaOcYhXuTqmvKA6hF
    ZtmjtioHZrvV75IoqAW3U1YibcS/21GSCLItpu9vSdJk3butqg20iH/5xPDRrXaP
    OhFupOQnmD0R5IY8d5/+KJChBjOfQa6XaBjYtq9gC5CdtdrHT++D59xyQ926EgPB
    tNAWQdKaPccA0KHfN/c5iw908v+oeCFN2wk0eKDqot3HHVVN0SOvHH7VDu90ug==
    -----END CERTIFICATE-----
 
  - |
    -----BEGIN CERTIFICATE-----
    MIID5TCCAs2gAwIBAgIQCuFmeYez8LJP4iV17G4SmzANBgkqhkiG9w0BAQUFADCB
    hDELMAkGA1UEBhMCUlUxDzANBgNVBAgTBk1vc2NvdzEPMA0GA1UEBxMGTW9zY293
    MSIwIAYDVQQKExknTHV4b2Z0IFByb2Zlc3Npb25hbCcgTExDMRYwFAYDVQQLEw1J
    VCBEZXBhcnRtZW50MRcwFQYDVQQDEw5MdXhvZnQgUm9vdCBDQTAeFw0xMjA4MTcw
    NTE2MjNaFw0yMjA4MTcwNTI2MjNaMIGEMQswCQYDVQQGEwJSVTEPMA0GA1UECBMG
    TW9zY293MQ8wDQYDVQQHEwZNb3Njb3cxIjAgBgNVBAoTGSdMdXhvZnQgUHJvZmVz
    c2lvbmFsJyBMTEMxFjAUBgNVBAsTDUlUIERlcGFydG1lbnQxFzAVBgNVBAMTDkx1
    eG9mdCBSb290IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2W0e
    W1G7MqLP/YNDSigPB0NcTeOhrtaMgGwpOZ3GeEGtebQAsvo3+UmHU337p1lNda8o
    77jKg8oYC0vYvykYg22Jdlj4na3ItdPPhabdB3K9CiyLXqa0zD4plnEMgJfJjdo1
    2fIrsp8/llONwTJriVqropgdk1OL57jRNCB4E092wqf1hV8u1dmYzdSDME19u4jC
    iPYVqUldlnkjZVMFvYIxIJwKvfbyoH4mRQrOz5dkVpGDMsHCfifwbjHyUedOlHDm
    nAywYPg3Ac9dCRLKbW5OAO3e4J5JjgYY9ffZ6P4BsbfIw7qPvSgEKs8CrRHsRrZB
    Lk5ag0muRYdf8ntHGwIDAQABo1EwTzALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUw
    AwEB/zAdBgNVHQ4EFgQUz5Jbd2y1D2hHvWZThypojru75/owEAYJKwYBBAGCNxUB
    BAMCAQAwDQYJKoZIhvcNAQEFBQADggEBAEMbhclLTCRP79S35TapgE7tJtyyc6uH
    qwdrZl2ELW26a4cMcxp8+Nq44H/iHpJHnYbHcm8QqakwZCtTUIe2m46c7ex7KtrD
    mshnbMhWzRudMVjf92pipz0OIBAbcopLky9pZu9mV1bQbPe5mb2Czgl3pdM2IT/C
    hngxcJE6Z09pwlxDN/tytC7NT+oRY0zV+CL1xgs20Fam3xzbAlbFxawbpHcswfYg
    R5nAsZpF26VCpZlo0vVC/EqtkjemqkeXvnlI8edrPCcHjd06ruG4xB1n9uAKCjZT
    iomhEVI5rwakQDO/fEX+EQBKqA/eHQfGxUIefywrIRVWo76b41u1BTU=
    -----END CERTIFICATE-----

apt:
  sources:
    kubernetes:
      source: "deb http://apt.kubernetes.io/ kubernetes-xenial main"
      # key from https://packages.cloud.google.com/apt/doc/apt-key.gpg
      key: |
        -----BEGIN PGP PUBLIC KEY BLOCK-----
        Version: GnuPG v1

        mQENBFUd6rIBCAD6mhKRHDn3UrCeLDp7U5IE7AhhrOCPpqGF7mfTemZYHf/5Jdjx
        cOxoSFlK7zwmFr3lVqJ+tJ9L1wd1K6P7RrtaNwCiZyeNPf/Y86AJ5NJwBe0VD0xH
        TXzPNTqRSByVYtdN94NoltXUYFAAPZYQls0x0nUD1hLMlOlC2HdTPrD1PMCnYq/N
        uL/Vk8sWrcUt4DIS+0RDQ8tKKe5PSV0+PnmaJvdF5CKawhh0qGTklS2MXTyKFoqj
        XgYDfY2EodI9ogT/LGr9Lm/+u4OFPvmN9VN6UG+s0DgJjWvpbmuHL/ZIRwMEn/tp
        uneaLTO7h1dCrXC849PiJ8wSkGzBnuJQUbXnABEBAAG0QEdvb2dsZSBDbG91ZCBQ
        YWNrYWdlcyBBdXRvbWF0aWMgU2lnbmluZyBLZXkgPGdjLXRlYW1AZ29vZ2xlLmNv
        bT6JAT4EEwECACgFAlUd6rICGy8FCQWjmoAGCwkIBwMCBhUIAgkKCwQWAgMBAh4B
        AheAAAoJEDdGwginMXsPcLcIAKi2yNhJMbu4zWQ2tM/rJFovazcY28MF2rDWGOnc
        9giHXOH0/BoMBcd8rw0lgjmOosBdM2JT0HWZIxC/Gdt7NSRA0WOlJe04u82/o3OH
        WDgTdm9MS42noSP0mvNzNALBbQnlZHU0kvt3sV1YsnrxljoIuvxKWLLwren/GVsh
        FLPwONjw3f9Fan6GWxJyn/dkX3OSUGaduzcygw51vksBQiUZLCD2Tlxyr9NvkZYT
        qiaWW78L6regvATsLc9L/dQUiSMQZIK6NglmHE+cuSaoK0H4ruNKeTiQUw/EGFaL
        ecay6Qy/s3Hk7K0QLd+gl0hZ1w1VzIeXLo2BRlqnjOYFX4CZAQ0EWsFo2wEIAOsX
        XwoJuxmWjg2MC9V5xMEKenpZwFAnmhKHv4T3yNf1jOdQKs2uCZ4JwIxS9MNEPF9N
        oMnJtoe6B9trjeeqGRs2knjthewhr5gvp4QT16ZKZC2OtJYiJj7ZgljCwOCyByQX
        d26qRvTY50FCWHohsc+hcHof/9vU+BliyiYH7zjVdbUtIk9iVhsitZ/AN9C+2QVA
        j3Svo2SdVNCWmpCHkYs1Y1ipE2sZA+awH42tRiuSXWdS3UtEa76sJ7htJpKY1vAo
        xAqRE4TiROIHvYM+TvMfgubS6jRgUVYbiqwwi6oSKEn/0o1fwZgGv61aDIuiguWx
        0reX7h1Wp3xyOQkzUTEAEQEAAbRAR29vZ2xlIENsb3VkIFBhY2thZ2VzIEF1dG9t
        YXRpYyBTaWduaW5nIEtleSA8Z2MtdGVhbUBnb29nbGUuY29tPokBPgQTAQIAKAUC
        WsFo2wIbLwUJBaOagAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQagMLIboH
        9Pvx7wf/VYfYs3+dU2GblNLVVgkbwH4hbzNLgGrKjPEL2IkAmpkhUdeXyDxr8e6z
        xF9dHtydgdyDyyNJol9CGo71Fsqd9+K5CAaurBDG4LaMFroz9ArN6NN4/QyCLrun
        Kssk1asUjvVGGuK1BmbNNnY+hbF+/pv5O/m/Ss9ob663Unjumf6RiC1Rop2wnPW6
        aLofMroBpwN/QLQKSwl0obsw5axlwHjF47Eli7Lo247opx0TPz9fIRSMi4g6WFhN
        3SEfwT9IQFtdd+3v9UFALnA2rjSLM+L7pYUr97U7jYMinNDvj2iBhDV6h17E82Ev
        N6QpHdeEas1cn3mvko7XRWuwsU13wg==
        =4CNh
        -----END PGP PUBLIC KEY BLOCK-----
package_upgrade: true
packages:
  - docker.io
  - [kubernetes-cni, 0.6.0-00]
  - [kubelet, 1.13.2-00]
  - [kubectl, 1.13.2-00]
  - [kubeadm, 1.13.2-00]
write_files:
  - path: /etc/systemd/system/kubernetes-pods-enable-forward.service
    content: |
      [Unit]
      Description=Forward k8s pods network
      DefaultDependencies=false
      [Service]
      Type=oneshot
      RemainAfterExit=yes
      ExecStart=/sbin/iptables -A FORWARD -d 10.244.0.0/16 -j ACCEPT
      ExecStart=/sbin/iptables -A FORWARD -s 10.244.0.0/16 -j ACCEPT
      ExecStop=
      [Install]
      WantedBy=sysinit.target
  - path: /etc/docker/daemon.json
    content: |
      {
        "insecure-registries": ["10.2.16.48:5000"]
      }

runcmd:
  - wget http://10.3.100.10:81/cpfw-login_amd64 -O /tmp/cpfw-login_amd64
  - chmod +x /tmp/cpfw-login_amd64
  - /tmp/cpfw-login_amd64
  - apt-get update
  - apt-get install -y docker.io kubernetes-cni=0.6.0-00 kubelet=1.13.2-00 kubectl=1.13.2-00 kubeadm=1.13.2-00
  - kubeadm init --pod-network-cidr 10.244.0.0/16 --kubernetes-version stable-1.13
  - kubectl --kubeconfig /etc/kubernetes/admin.conf taint nodes --all node-role.kubernetes.io/master-
  - mkdir -p /root/.kube
  - cp -i /etc/kubernetes/admin.conf /root/.kube/config
  - sleep 20
  - kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/coreos/flannel/62e44c867a2846fefb68bd5f178daf4da3095ccb/Documentation/kube-flannel.yml
  - sleep 10
  - kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
  - systemctl daemon-reload
  - usermod -aG docker ubuntu
  - mkdir /home/ubuntu/.kube
  - cp /etc/kubernetes/admin.conf /home/ubuntu/.kube/config
  - chown -R ubuntu:ubuntu /home/ubuntu/.kube
  - git clone https://github.com/intel/multus-cni.git && cd multus-cni
  - cat ./images/multus-daemonset.yml | kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f -
  - brctl addbr cbr0
  - ip link set dev cbr0 up
  - wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.0-linux-amd64.tar.gz -O /tmp/helm-v2.13.0-linux-amd64.tar.gz --no-check-certificate
  - tar xvf /tmp/helm-v2.13.0-linux-amd64.tar.gz -C /tmp
  - mv /tmp/linux-amd64/helm /usr/local/bin/helm
  - chmod +x /usr/local/bin/helm
  -  /usr/local/bin/helm init --kubeconfig /etc/kubernetes/admin.conf
  - mkdir -p /home/ubuntu/certs
  - printf "\n[SAN]\nsubjectAltName=DNS:lab_machine.localdomain,IP:$(ip route get 8.8.8.8| head -1|cut -d' ' -f8)\n" >> /etc/ssl/openssl.cnf
  - openssl req -x509 -nodes -sha256 -newkey rsa:4096 -keyout /home/ubuntu/certs/domain.key -out /home/ubuntu/certs/domain.crt -subj "/C=RO/ST=BUCHAREST/L=BUCHAREST/O=SDL Dev/OU=SDL/CN=$(ip route get 8.8.8.8| head -1|cut -d' ' -f8)" -config /etc/ssl/openssl.cnf -extensions SAN
  - docker run -d --restart=always --name registry -v /home/ubuntu/certs:/certs -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key -p 5001:5001 registry:2
  - sed -ie "s;];, \"$(ip route get 8.8.8.8|head -1|cut -d' ' -f8):5001\"];g" /etc/docker/daemon.json
  - service docker restart
power_state:
  timeout: 300
mode: reboot
