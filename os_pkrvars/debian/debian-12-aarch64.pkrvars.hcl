os_name                 = "debian"
os_version              = "12"
os_arch                 = "aarch64"
# iso_url                 = "https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/debian-12.9.0-arm64-netinst.iso" # Netinst
# iso_url                 = "https://cdimage.debian.org/cdimage/release/12.9.0/arm64/iso-dvd/debian-12.9.0-arm64-DVD-1.iso" # DVD
iso_url                 = "/Volumes/MacMiniT7/Developer/UTMvagrant/isofiles/debian-12.9.0-arm64-DVD-1.iso" # local
iso_checksum            = "file:https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/SHA512SUMS"
# Advance Options -> Automated Install 
boot_command            = ["<wait><down><down><enter><down><down><down><down><down><enter>"]
shutdown_command        = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name                = "debian-12"

