os_name          = "kali"
os_version       = "2024.4"
os_arch          = "aarch64"
// https://kali.download/cloud-images/kali-2024.4/kali-linux-2024.4-cloud-genericcloud-arm64.tar.xz
iso_url          = "/Volumes/MacMiniT7/Developer/UTMvagrant/cloudfiles/kali-linux-2024.4-cloud-genericcloud-arm64.raw"
iso_checksum     = "5cf622deef22b125068ef38d0f80e15fd11a64939f45140f9d7474c2fe749f63"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "kali-cloud"

# the image is itself large enough to be used as a cloud image
resize_cloud_image = false

# Send cloud-init data via cdrom
cd_files = [
  "./packer_templates/http/kali-cloud/meta-data",
  "./packer_templates/http/kali-cloud/user-data",
  "./packer_templates/http/kali-cloud/vendor-data",
]
cd_label = "cidata"

# ISSUE: kali does not have cloud-init enabled by default
# Ref: https://www.reddit.com/r/Proxmox/comments/1gnbcaz/cloudinit_not_working_with_kali_image/
# SOLVED: I had to modify the initial qcow2 with virt-customize to run systemctl enable cloud-init-main