# Debian

Building Vagrant compatible UTM box using UTM file (from UTM Gallery) with packer.

The process is semi-automated.
1. We should manually create a vagrant ssh user in the VM.
2. Run Packer template using the vagrant user


## 1. Manual Preparation

1. Download Debian UTM file from [UTM gallery](https://mac.getutm.app/gallery/) , unzip to get UTM file

2. Open the file in UTM (you can also drag and drop)

3. Change the Name of VM to remove any space ( required for packer to indentify VM)

4. Add a second network interface and set the mode to 'Emulated VLAN'  ( we need this for packer and vagrant to connect)


5. After Saving , Start the VM and login using credentials given in Gallery 


6. Add vagrant user by executing below commands (as sudo)

```bash
# Add the user vagrant and set the password
sudo useradd -m -s /bin/bash -c "vagrant" -p $(echo vagrant | openssl passwd -1 -stdin) vagrant

# Add vagrant user to sudo group (allow ssh using password)
sudo usermod -aG sudo vagrant

# Let the vagrant user sudo without a password
sudo mkdir -p /etc/sudoers.d
echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/vagrant

# install wget
sudo apt-get install -y wget
```

7. Shut down

```bash
echo 'debian' | sudo -S /sbin/halt -h -p
```

8. Remove the VM from UTM

9. Change the UTM file name to be same as VM name (required for packer to indentify VM)


## 2. Packer 

This step runs the vagrant specific tasks (taken from chef/bento templates)

1. Update variables in pkr-sources.pkr.hcl
  Source should point to your UTM file
  VM name shoudl point to your VM name

```json
// Path to UTM file
utm_source_path = "Debian11.utm"
utm_vm_name = "Debian11"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
```

2. Start packer build

```bash
PACKER_LOG=1 packer build  -var-file=os_pkrvars/debian/debian-11-aarch64.pkrvars.hcl packer_templates/
```

3. When promted for exporting VM, remove Devices from VM manually (No UTM API available to remove device)
  * Remove any Display Device (for Headless)
  * Remove any Sound Device
  * Add Serial Device and set it to Pseudo-TTY (for debugging)

4. After removing devices, export ('Share') VM to the said path (So post-processor can zip it)

5. Confirm export in command line by pressing 'y'

6. After build is successful, remove VM from UTM.

Your vagrant compatible VM is ready to use!


## Use with vagrant


You can now use the produced zip file with vagrant

```bash
python3 -m http.server                                                                            
Serving HTTP on :: port 8000 (http://[::]:8000/) ...
```


Use in Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  config.vm.provider :utm do |utm|
    utm.utm_file_url = "http://localhost:8000/vm_vagrant_utm.zip"
  end
end
```