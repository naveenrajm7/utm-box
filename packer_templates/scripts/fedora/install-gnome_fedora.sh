#!/bin/bash

echo "Installing GNOME Desktop..."
dnf group install -y gnome-desktop

echo "Enabling graphical target..."
systemctl set-default graphical.target

echo "Installation complete. Reboot the system to start GUI."
echo "Run: sudo reboot"