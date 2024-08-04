#!/bin/sh -eux

# Use this if autoinstall is no used
# or vagrant user does not exist


# Add the user vagrant and set the password
useradd -m -s /bin/bash -c "vagrant" -p $(echo vagrant | openssl passwd -1 -stdin) vagrant

# Add vagrant user to wheel group (sudo equivalent in Arch)
usermod -aG wheel vagrant

# Let the wheel group sudo without a password
echo '%wheel ALL=(ALL) NOPASSWD: ALL' | tee -a /etc/sudoers.d/99_wheel

pacman -Sy wget --noconfirm
