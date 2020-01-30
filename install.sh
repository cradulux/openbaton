#!/bin/bash
#
# This is a  script file used to configure the IP
# address of the data interface based on the VNF parameters supplied by 
# SuperCloud at boot time and the management IP configured through DHCP.
#

ip address add 127.0.0.11 dev eth1
ifconfig eth1 up

exit 0
