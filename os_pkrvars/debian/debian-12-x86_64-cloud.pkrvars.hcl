os_name          = "debian"
os_version       = "12"
os_arch          = "x86_64"
iso_url          = "https://cdimage.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
iso_checksum     = "file:https://cdimage.debian.org/images/cloud/bookworm/latest/SHA512SUMS"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "bookworm"

# Send cloud-init data via cdrom
cd_files = [
  "./packer_templates/http/debian-cloud/meta-data",
  "./packer_templates/http/debian-cloud/user-data",
  "./packer_templates/http/debian-cloud/vendor-data",
]
cd_label = "cidata"

# on ARM MAC , hypervisor is not supported for x86 VMs
hypervisor = false

# on ARM MAC building x86 VMs, cd should not have -hfs option
# -hfs: Creates an HFS+ filesystem for macOS compatibility.
# an x86 VM might not understand HFS+ filesystem coming from ARM MAC.