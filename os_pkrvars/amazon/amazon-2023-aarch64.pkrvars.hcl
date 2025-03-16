os_name          = "amazon"
os_version       = "2023"
os_arch          = "aarch64"
iso_url          = "https://cdn.amazonlinux.com/al2023/os-images/2023.6.20250303.0/kvm-arm64/al2023-kvm-2023.6.20250303.0-kernel-6.1-arm64.xfs.gpt.qcow2"
iso_checksum     = "file:https://cdn.amazonlinux.com/al2023/os-images/2023.6.20250303.0/kvm-arm64/SHA256SUMS"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "al2023"

# Do not resize the cloud image
resize_cloud_image = false
# Pass cloud-init data via cd_content
cd_content = {
    "meta-data" = <<EOF
local-hostname: al2023
EOF
    "user-data" = <<EOF
#cloud-config
password: ec2-user
chpasswd:
  expire: False
users:
  - default
  - name: vagrant
    gecos: Vagrant User
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    homedir: /home/vagrant
    lock_passwd: false
    plain_text_passwd: vagrant
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
        name: e*
      dhcp4: true
EOF
  }

cd_label = "cidata"