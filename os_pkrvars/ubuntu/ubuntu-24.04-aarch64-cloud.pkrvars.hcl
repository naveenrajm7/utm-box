os_name                 = "ubuntu"
os_version              = "24.04"
os_arch                 = "aarch64"
box_name                = "noble"
iso_url                 = "https://cloud-images.ubuntu.com/noble/20241210/noble-server-cloudimg-arm64.img"
iso_checksum            = "file:https://cloud-images.ubuntu.com/noble/20241210/SHA256SUMS"
shutdown_command        = "echo 'vagrant' | sudo -S /sbin/halt -h -p"