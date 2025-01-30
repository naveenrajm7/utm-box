os_name    = "debian"
os_version = "12"
os_arch    = "aarch64"
# iso_url                 = "https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/debian-12.9.0-arm64-netinst.iso" # Netinst
# iso_checksum = "file:https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/SHA512SUMS"

# iso_url                 = "https://cdimage.debian.org/cdimage/release/12.9.0/arm64/iso-dvd/debian-12.9.0-arm64-DVD-1.iso" # DVD
iso_url      = "/Volumes/MacMiniT7/Developer/UTMvagrant/isofiles/debian-12.9.0-arm64-DVD-1.iso" # local
iso_checksum = "file:https://cdimage.debian.org/debian-cd/current/arm64/iso-dvd/SHA512SUMS"

# Install with speech synthesis  (Need Sound Card for this to work)
# Install with speech synthesis to avoid black screen issue with UTM
boot_command     = ["<wait><down><down><down><down><wait>e<down><down><down><end> auto=true priority=critical interface=enp0s2 url=http://{{.HTTPIP}}:{{.HTTPPort}}/debian/preseed.cfg<wait><f10><wait>"]
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "debian-12"

# working display
display = "virtio-gpu-pci"
# Need sound card for speech synthesis