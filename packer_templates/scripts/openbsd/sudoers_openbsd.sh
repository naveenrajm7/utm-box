#!/bin/ksh -eux

## THIS IS ONLY OPTIONAL, IF YOU WANT TO USE SUDO INSTEAD OF DOAS

# Install default sudo package
pkg_add sudo--

# Add 'wheel' group to sudoers with password-less sudo
echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add the 'vagrant' user to the 'wheel' group
usermod -G wheel vagrant