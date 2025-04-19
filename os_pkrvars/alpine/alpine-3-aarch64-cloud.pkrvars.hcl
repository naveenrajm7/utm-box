os_name          = "alpine"
os_version       = "3"
os_arch          = "aarch64"
os_icon          = "alpine"
iso_url          = "https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/cloud/generic_alpine-3.21.2-aarch64-uefi-cloudinit-r0.qcow2"
iso_checksum     = "7f6439edaaf9fc208e4aede2c7e920adeb43ad0c8641164e3a9184809150357f426c99881c1157510833c5ab95f184e23dce2216ea9d591d3b479c3fe90ab9c8"
shutdown_command = "echo 'vagrant' | su -m root -c poweroff"
box_name         = "alpine3-ce"

# Send cloud-init data via cdrom
cd_files = [
  "./packer_templates/http/alpine-cloud/meta-data",
  "./packer_templates/http/alpine-cloud/user-data",
  "./packer_templates/http/alpine-cloud/vendor-data",
]
cd_label = "cidata"