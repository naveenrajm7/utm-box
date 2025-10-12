os_name      = "openbsd"
os_version   = "7.7"
os_arch      = "aarch64"
os_icon      = "openbsd"
box_name     = "openbsd-7.7"
iso_url      = "https://cdn.openbsd.org/pub/OpenBSD/7.7/arm64/install77.iso"
iso_checksum = "217c19dc76fcbcdec7ca17dcd094d35f8c22180f208f0a4358d91bf650a4dc0e"
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