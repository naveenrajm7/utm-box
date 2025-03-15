os_name    = "kali"
os_version       = "2024.4"
os_arch          = "aarch64"

# Netinst
# iso_url                 = "https://cdimage.kali.org/kali-2024.4/kali-linux-2024.4-installer-netinst-arm64.iso"
iso_url      = "/Volumes/MacMiniT7/Developer/UTMvagrant/isofiles/kali-linux-2024.4-installer-netinst-arm64.iso" # local 
iso_checksum = "d8be15781c996fcca541c371589f7486cb31f4069b7a2e7d81798e5550b8a1d0"

# Normal install 
boot_command     = ["<wait>e<down><down><down><end> auto=true priority=critical interface=eth1 url=http://{{.HTTPIP}}:{{.HTTPPort}}/kali/preseed.cfg<wait><f10><wait>"]
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "kali"

# working display
display = "virtio-gpu-pci"
# Need sound card for speech synthesis install
# Need serial for normal install (screen ptty device to see boot process)

# See seed : https://github.com/blink-zero/kali-2024.1-preseed/blob/main/ks.pkrtpl.hcl