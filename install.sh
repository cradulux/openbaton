#!/bin/bash
#
# This is a  script file used to configure the IP
# address of the data interface based on the VNF parameters supplied by 
# SuperCloud at boot time and the management IP configured through DHCP.
#

lxc_ulmo_env_file=/mnt/ulmo/metadata/ulmo_env
cloud_init_ulmo_env_file=/usr/local/etc/supercloud/ulmo_env

# Include the ulmo environment variables
if [ -f $lxc_ulmo_env_file ]; then
    source $lxc_ulmo_env_file
fi
if [ -f $cloud_init_ulmo_env_file ]; then
    source $cloud_init_ulmo_env_file
fi


if [ "$DATA_SUBNET" == "DHCP" ]; then
    # Check if data interface is plugged in
    dataEthOrEmpty=$(ifconfig | grep -oE "eth1")
    if [ "$dataEthOrEmpty" != "" ]; then
        ifconfig eth1 up
        dhclient eth1
    fi
    exit 0
fi

# Extract ip from management interface
theIPaddress=$(ip addr show eth0 | grep "inet\b" |awk '{print $2}' | cut -d/ -f1)
echo "eth0 ip address: "
echo $theIPaddress
if [ "$theIPaddress" != "" ]; then
    IFS='.' read -a mgmt_ip_array <<< "$theIPaddress"
    IFS='.' read -a data_ip_array <<< "$DATA_SUBNET"

    # Build data IP based on management IP and the prefix supplied by Supercloud 
    data_ip_array[3]=${mgmt_ip_array[3]}

    dataIP=$(printf ".%s" "${data_ip_array[@]}")
    dataIP=${dataIP:1}

    # mask digits
    mask="/24"
    dataIP=$dataIP$mask
    echo "Data IP address: "
    echo $dataIP

    # Check if data interface is plugged in
    dataEthOrEmpty=$(ifconfig | grep -oE "eth1")
    if [ "$dataEthOrEmpty" != "" ]; then
        ip address add $dataIP dev eth1
        ifconfig eth1 up
    fi
fi

exit 0
