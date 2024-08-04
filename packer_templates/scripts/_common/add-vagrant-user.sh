#!/bin/sh -eux

# Use this if autoinstall is no used
# or vagrant user does not exist


# Add the user vagrant and set the password
useradd -m -s /bin/bash -c "vagrant" -p $(echo vagrant | openssl passwd -1 -stdin) vagrant
# echo "vagrant:vagrant" | sudo chpasswd

# Add vagrant user to sudo group (allow ssh using password)
usermod -aG sudo vagrant

# Let the vagrant user sudo without a password
mkdir -p /etc/sudoers.d
echo "vagrant ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant

# install wget
apt-get install -y wget