#!/bin/bash

# Backup existing network configuration
cp /etc/network/interfaces /etc/network/interfaces.bak

# Append new DHCP configuration for enp0s1 and enp0s2 
cat <<EOF >> /etc/network/interfaces

# Enable DHCP for enp0s1
allow-hotplug enp0s1
iface enp0s1 inet dhcp

# Enable DHCP for enp0s2
allow-hotplug enp0s2
iface enp0s2 inet dhcp
EOF

# Restart networking service
systemctl restart networking

echo "DHCP has been enabled for enp0s1 and enp0s2. Please reboot if needed."