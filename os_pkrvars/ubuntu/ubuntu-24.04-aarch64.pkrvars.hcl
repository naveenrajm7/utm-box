os_name                 = "ubuntu"
os_version              = "24.04"
os_arch                 = "aarch64"
iso_url                 = "/Users/naveenrajm/Developer/UTMvagrant/ubuntu-24.04-live-server-arm64.iso"
iso_checksum            = "d2d9986ada3864666e36a57634dfc97d17ad921fa44c56eeaca801e7dab08ad7"
parallels_guest_os_type = "ubuntu"
vbox_guest_os_type      = "Ubuntu_64"
vmware_guest_os_type    = "arm-ubuntu-64"
// Until we figure out how to access host port from within the VM, we shall test with the following URL
boot_command            = ["<wait>e<wait><down><down><down><end> autoinstall quiet 'ds=nocloud-net;s=https://raw.githubusercontent.com/chef/bento/main/packer_templates/http/ubuntu/'<wait><f10><wait>"]