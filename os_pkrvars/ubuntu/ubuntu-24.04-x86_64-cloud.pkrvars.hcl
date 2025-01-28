os_name                 = "ubuntu"
os_version              = "24.04"
os_arch                 = "x86_64"
iso_url                 = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
iso_checksum            = "file:https://cloud-images.ubuntu.com/noble/current/SHA256SUMS"
shutdown_command        = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name                = "noble"

# Send cloud-init data via cdrom
cd_files                = [
  "./packer_templates/http/ubuntu-cloud/meta-data",
  "./packer_templates/http/ubuntu-cloud/user-data",
  "./packer_templates/http/ubuntu-cloud/vendor-data",
]
cd_label                = "cidata"

# on ARM MAC , hypervisor is not supported for x86 VMs
hypervisor              = false

# on ARM MAC building x86 VMs, cd should not have -hfs option
# -hfs: Creates an HFS+ filesystem for macOS compatibility.
# an x86 VM might not understand HFS+ filesystem coming from ARM MAC.
