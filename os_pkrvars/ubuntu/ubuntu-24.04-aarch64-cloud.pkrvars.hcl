os_name          = "ubuntu"
os_version       = "24.04"
os_arch          = "aarch64"
iso_url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64.img"
iso_checksum     = "file:https://cloud-images.ubuntu.com/noble/current/SHA256SUMS"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "noble"

# Send cloud-init data via cdrom
cd_files = [
  "./packer_templates/http/ubuntu-cloud/meta-data",
  "./packer_templates/http/ubuntu-cloud/user-data",
  "./packer_templates/http/ubuntu-cloud/vendor-data",
]
cd_label = "cidata"