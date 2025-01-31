#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use: sudo $0"
   exit 1
fi

echo "Updating package list..."
apt update

echo "Installing minimal GNOME and GDM3..."
apt install -y --no-install-recommends gnome-core gdm3

echo "Enabling GDM3 as the default display manager..."
dpkg-reconfigure gdm3

echo "Enabling graphical target..."
systemctl set-default graphical.target

echo "Installation complete. Reboot the system to start GUI."
echo "Run: sudo reboot"