# Debian 11

Building Vagrant compatible UTM box using Debian UTM file (from Gallery) with packer.


## Manual prepare

* Download Debian UTM from gallery , unzip to get UTM file

* Open in UTM
* Change the VM name
* Add Emulated VLAN as second network interface (TODO: Automate this in packer)
* Save
* Remove from VM
* Change the UTM file name to the VM name

>Need to make sure the VM name and file name are same, 
> Because our packer plugin does not know the VM name once it loads

## Packer Prepare

Update variables prepare-debian.pkr.hcl

```
source_path = "/Users/naveenrajm/Developer/UTMvagrant/utm_gallery/Debian11G.utm"
vm_name = "Debian11G"
```

```bash
PACKER_LOG=1 packer build  -var-file=os_pkrvars/debian/debian-11-aarch64.pkrvars.hcl prepare-debian.pkr.hcl
```

* Export to the said folder

* Remove VM from UTM


## Packer build

Update variables in pkr-sources.pkr.hcl

```json
utm_source_path = "/Users/naveenrajm/Developer/UTMvagrant/utm_box/output-prepare/Debian11G.utm"
utm_vm_name = "Debian11G"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
```

Start build
```bash
PACKER_LOG=1 packer build  -var-file=os_pkrvars/debian/debian-11-aarch64.pkrvars.hcl packer_templates/
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
    utm.utm_file_url = "http://localhost:8000/debian_vagrant_utm.zip"
  end
end
```