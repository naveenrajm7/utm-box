# Arch Linux

Building Vagrant compatible UTM box using ArchLinux UTM file (from Gallery) with packer.


## Manual prepare

* Download ArchLinux from gallery , unzip to get UTM file

* Add Emulated VLAN as second network interface (TODO: Automate this in packer)

* Open in UTM , start and Login

```bash
alarm login: root
Password: root
```

* Run necessary commands
Make sure root can login through ssh using password
Packer will connect through ssh 
Make sure to install sudo, packer uses sudo to copy files 
Make sure to enable public key authentication which vagrant uses later
```bash
vi /etc/ssh/sshd_config
# Edit the file to set:
# PermitRootLogin yes
# PasswordAuthentication yes
# PubkeyAuthentication yes

systemctl restart sshd

# Install sudo , required for packer 
# Update package database and install sudo
pacman -Syu --noconfirm
pacman -Sy sudo --noconfirm

# shutdown so the changes are saved
echo 'root' | /sbin/halt -h -p
```


* Remove VM from UTM

* Update variables in prepare-arch.pkr.hcl

```json
source_path = "..."
```


## Packer Prepare

```bash
PACKER_LOG=1 packer build  -var-file=os_pkrvars/arch/arch-aarch64.pkrvars.hcl prepare-arch.pkr.hcl
```

Export to the said folder


Remove VM from UTM


## Packer build

Update variables in pkr-sources.pkr.hcl

utm_source_path
utm_vm_name

Start build
```bash
PACKER_LOG=1 packer build  -var-file=os_pkrvars/arch/arch-aarch64.pkrvars.hcl packer_templates/
```

* Remove Devices from VM Manually (No Scripting Interface available)
  * Remove any Display Device
  * Remove any Sound Device
  * Add Serial Device and set it to Pseudo-TTY (for Headless VM)

Export 

Remove VM from UTM


You can now use the produced zip file with vagrant or directly with UTM after unzipping.

```bash
python3 -m http.server                                                                            
Serving HTTP on :: port 8000 (http://[::]:8000/) ...
```


Use in Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  config.vm.provider :utm do |utm|
    utm.utm_file_url = "http://localhost:8000/arch_vagrant_utm.zip"
  end
end
```