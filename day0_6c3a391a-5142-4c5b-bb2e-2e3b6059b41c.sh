#!/bin/bash
#
# This is a  script file used to configure the IP
# address of the data interface based on the VNF parameters supplied by 
# SuperCloud at boot time and the management IP configured through DHCP.
#

sudo ifconfig eth1 up
sudo ifconfig eth1 10.3.100.84/24

exit 0

