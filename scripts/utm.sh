#!/bin/sh -eux

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";


echo "installing deps necessary for UTM guest support"
# We install things like spice-vdagent (clipboard sharing and dynamic display resolution )
# QEMU Agent (time syncing and scripting are supported by the QEMU agent.)
# SPICE WebDAV (QEMU directory sharing)
if [ -f "/bin/dnf" ]; then
    dnf install -y --skip-broken spice-vdagent qemu-guest-agent spice-webdavd
elif [ -f "/bin/yum" ] || [ -f "/usr/bin/yum" ]; then
    yum install -y --skip-broken spice-vdagent qemu-guest-agent spice-webdavd
elif [ -f "/usr/bin/apt-get" ]; then
    apt-get install -y spice-vdagent qemu-guest-agent spice-webdavd
elif [ -f "/usr/bin/pacman" ]; then
    pacman -S spice-vdagent qemu-guest-agent phodav
fi

# from bento virtualbox scripts. (remoce what we can)
echo "removing kernel dev packages and compilers we no longer need"
if [ -f "/bin/dnf" ]; then
    dnf remove -y gcc cpp kernel-headers kernel-devel kernel-uek-devel
elif [ -f "/bin/yum" ] || [ -f "/usr/bin/yum" ]; then
    yum remove -y gcc cpp kernel-headers kernel-devel kernel-uek-devel
elif [ -f "/usr/bin/apt-get" ]; then
    apt-get remove -y build-essential gcc g++ make libc6-dev dkms linux-headers-"$(uname -r)"
elif [ -f "/usr/bin/zypper" ]; then
    zypper -n rm -u kernel-default-devel gcc make
fi