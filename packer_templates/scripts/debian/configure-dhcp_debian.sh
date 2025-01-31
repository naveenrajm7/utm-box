#!/bin/bash

# Backup existing network configuration
cp /etc/network/interfaces /etc/network/interfaces.bak

# Append new DHCP configuration for ens0s1 and ens0s2
cat <<EOF >> /etc/network/interfaces

# Enable DHCP for ens0s1
allow-hotplug ens0s1
iface ens0s1 inet dhcp

# Enable DHCP for ens0s2
allow-hotplug ens0s2
iface ens0s2 inet dhcp
EOF

# Restart networking service
systemctl restart networking

echo "DHCP has been enabled for ens0s1 and ens0s2. Please reboot if needed."