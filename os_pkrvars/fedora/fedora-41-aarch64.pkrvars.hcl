os_name          = "fedora"
os_version       = "41"
os_arch          = "aarch64"
# iso_url         = "https://download.fedoraproject.org/pub/fedora/linux/releases/41/Server/aarch64/iso/Fedora-Server-netinst-aarch64-41-1.4.iso" # url
iso_url          = "/Volumes/MacMiniT7/Developer/UTMvagrant/isofiles/Fedora-Server-netinst-aarch64-41-1.4.iso" # local
iso_checksum     = "file:https://download.fedoraproject.org/pub/fedora/linux/releases/41/Server/aarch64/iso/Fedora-Server-41-1.4-aarch64-CHECKSUM"
boot_command     = ["<wait><up><wait>e<down><down><end> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/fedora/ks.cfg<F10>"]
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "fedora-41"

display = "virtio-gpu-pci" #+GL 
# Attach serial console built-in terminal to see boot process, 
# or do screen ptty device to see boot process
# the main display will be blank once boot process until login
