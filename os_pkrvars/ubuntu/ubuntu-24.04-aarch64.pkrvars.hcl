os_name           = "ubuntu"
os_version        = "24.04"
os_arch           = "aarch64"
iso_url           = "/Volumes/MacMiniT7/Developer/UTMvagrant/isofiles/ubuntu-24.04.1-live-server-arm64.iso"
iso_checksum      = "e6177edf1605655dc85808cdac20592bfbbb204cf35101bd6d47cbb7efc3c810480e0ed95805528e94edcf6fca6ca4bff9f2977298aa6d90c7b6a38e98799442"
utm_guest_os_type = "Ubuntu_64"
boot_command      = ["<wait>e<wait><down><down><down><end> autoinstall quiet 'ds=nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/ubuntu/'<wait><f10><wait>"]
memory            = "4096"
// MUST: In order to make sure utm export gets absolute path
// Abosulte path is required for AppleScript to work
output_directory = "/Users/naveenrajm/Developer/UTMvagrant/utm_box/output-vm"

# utm-utm
# Source block provider specific
# utm-utm
utm_source_path  = "/Volumes/MacMiniT7/Developer/UTMvagrant/Ubuntu-24.04.utm"
utm_vm_name      = "Ubuntu-24.04"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"