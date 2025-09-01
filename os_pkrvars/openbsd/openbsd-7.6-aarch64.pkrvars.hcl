os_name      = "openbsd"
os_version   = "7.6"
os_arch      = "aarch64"
os_icon      = "openbsd"
box_name     = "openbsd-7.6"
iso_url      = "https://cdn.openbsd.org/pub/OpenBSD/7.6/arm64/install76.iso"
iso_checksum = "file:https://cdn.openbsd.org/pub/OpenBSD/7.6/arm64/SHA256"
boot_wait    = "30s"
# Replace IP address with Shared_Net_Address from /Library/Preferences/SystemConfiguration/com.apple.vmnet.plist
#  (TODO: Automate this)
boot_command = ["<wait>A<enter><wait5><enter><wait5>http://192.168.76.1:{{.HTTPPort}}/openbsd/install.conf<enter>"]
ssh_timeout  = "10m"
# Assumes ssh user (vagrant) exists and can doas without password
shutdown_command = "doas -u root shutdown -p now"

# UTM 
uefi_boot = true
display_hardware_type = "virtio-ramfb"