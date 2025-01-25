os_name                 = "fedora"
os_version              = "41"
os_arch                 = "aarch64"
iso_url                 = "https://download.fedoraproject.org/pub/fedora/linux/releases/41/Workstation/aarch64/images/Fedora-Workstation-41-1.4.aarch64.raw.xz"
iso_checksum            = "file:https://download.fedoraproject.org/pub/fedora/linux/releases/41/Workstation/aarch64/images/Fedora-Workstation-41-1.4-aarch64-CHECKSUM"
shutdown_command        = "echo 'vagrant' | sudo -S /sbin/halt -h -p"


display = "pci-gl" // and pci