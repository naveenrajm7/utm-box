#!/bin/bash

echo "Installing minimal GNOME and GDM3..."
apt install -y --no-install-recommends gnome-core gdm3

echo "Starting gdm..."
systemctl start gdm

echo "Enabling GDM3 as the default display manager..."
dpkg-reconfigure gdm3

echo "Enabling graphical target..."
systemctl set-default graphical.target

echo "Installation complete. Reboot the system to start GUI."
echo "Run: sudo reboot"