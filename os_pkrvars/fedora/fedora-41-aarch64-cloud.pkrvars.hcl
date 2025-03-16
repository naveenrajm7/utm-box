os_name          = "fedora"
os_version       = "41"
os_arch          = "aarch64"
iso_url          = "https://download.fedoraproject.org/pub/fedora/linux/releases/41/Cloud/aarch64/images/Fedora-Cloud-Base-Generic-41-1.4.aarch64.qcow2"
iso_checksum     = "file:https://download.fedoraproject.org/pub/fedora/linux/releases/41/Cloud/aarch64/images/Fedora-Cloud-41-1.4-aarch64-CHECKSUM"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "fedora41-ce"

use_cd = false

# Use http-config to pass cloud-init data
http_content = {
    "/meta-data" = <<EOF
local-hostname: fedora
EOF
    "/user-data" = <<EOF
#cloud-config
hostname: fedora
users:
  - name: vagrant
    gecos: Vagrant User
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    homedir: /home/vagrant
    lock_passwd: false
    passwd: '$6$rounds=4096$5CU3LEj/MQvbkfPb$LmKEF9pCfU8R.dA.GemgE/8GT6r9blge3grJvdsVTMFKyLEQwzEF3SGWqAzjawY/XHRpWj4fOiLBrRyxJhIRJ1'
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1YdxBpNlzxDqfJyw/QKow1F+wvG9hXGoqiysfJOn5Y vagrant insecure public key
chpasswd:
  users:
    - {name: root, password: vagrant}
  expire: false  
ssh_pwauth: true
network:
  version: 2
  ethernets:
    all:
      match:
        name: en*
      dhcp4: true
EOF
}