# How to build UTM Box


This method was used to produce the debian UTM package from ISO.
## Debian 

0. Download ISO : https://www.debian.org/download
1. ISO : debian-12.6.0-arm64-netinst
2. Create VM   
    Virtualize -> Linux -> ISO -> Memory (512MB) , CPU (1)
3. Installation  
3.a Install with speech sythesis (to get around display issue)  
3.b 'e'     Edit boot command  
3.c Select autoinstall with your own preseed.cfg
  ```bash
  setparams 'Install with speech sythesis' # to avoid video 

  set background_color=black
  linux /install.a64/vmlinuz auto=true priority=critical url=https://raw.githubusercontent.com/chef/bento/main/packer_templates/http/debian/preseed.cfg debian-installer/allow_unauthenticated_ssl=true netcfg/choose_interface=eth0 --- quiet
  initrd /install.a64/gtk/initrd.gz
  ```
 You can host your own preseed.cfg in another UTM VM by running ```python3 -m http.server```, replace the url with ```http://<ip-address>:8000/preseed.cfg```. 

4. Post Installation  
  4.a Shut down the VM  
  4.b Remove the `USB Driver` in VM Settings `Drives`  

5. Vagrant Stuff  
  5.a Power On and Log in   
  5.b 
  ```bash

Debian GNU/Linux 12 debian ttyAMA0

debian login: 
debian login: vagrant
  ```
  5.c Execute all scripts required for vagrant (from bento) and UTM.


* Update system packages
[update_debian.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/debian/update_debian.sh)

* Add MOTD
[motd.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/_common/motd.sh)

* Configure SSHD
[sshd.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/_common/sshd.sh)

* Fix interface naming as needed
[networking_debian.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/debian/networking_debian.sh)

* Add vagrant user to the sudoers
[sudoers_debian.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/debian/sudoers_debian.sh)

* Add Vagrant public key
[vagrant.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/_common/vagrant.sh)

* Debian systemd bug fix
[systemd_debian.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/debian/systemd_debian.sh)

* Install UTM Guest additions for Linux
[utm.sh](./scripts/utm.sh)

* Cleaup packages
[cleanup_debian.sh](https://github.com/chef/bento/blob/main/packer_templates/scripts/debian/cleanup_debian.sh)

* Reduce VM size
https://wiki.debian.org/QEMU
```bash
dd if=/dev/zero of=/tmp/junk ; sync ; rm /tmp/junk
```

* Reduce GRUB timeout
```bash
sudo vi /etc/default/grub
GRUB_TIMEOUT=0
sudo update-grub
```

* Network Devices
  * The first network interface should be shared network (To access VM)
  * The second network interface should be Emulated VLAN (For port forwarding)  
* Display Devices
  * Keep one Serial port with mode 'Pseudo-TTY Device'
  * Remove all other display (To make VM headless)
* Remove all Sound devices

6. Export VM (UTM 'Share')

