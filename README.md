# UTM box

Packer templates to build Vagrant compatible [UTM](https://mac.getutm.app/) boxes using [Vagrant Packer plugin](https://github.com/naveenrajm7/packer-plugin-utm).  
Boxes are hosted at [HCP Vagrant Registry](https://portal.cloud.hashicorp.com/vagrant/discover/utm).  
The Boxes can be used with Vagrant using [Vagrant UTM plugin](https://naveenrajm7.github.io/vagrant_utm).  



## Building Boxes

#### Requirements
* Packer
* UTM
* UTM packer plugin (packer init will install)

#### Examples 

To build a OpenBSD 7.8 box with UTM provider ISO builder (utm-iso)

```bash
packer init packer_templates
packer build --only=utm-iso.vm -except=artifice,vagrant-registry -var-file=os_pkrvars/openbsd/openbsd-7.6-aarch64.pkrvars.hcl ./packer_templates
```

To build Debian box using cloud image with UTM provider cloud builder (utm-cloud).
Fully automated build, provision and publish Vagrant box.
```bash
export HCP_CLIENT_ID=<id>
export HCP_CLIENT_SECRET=<secret>
packer build --only=utm-cloud.vm -var-file=os_pkrvars/debian/debian-12-aarch-cloud.pkrvars.hcl -var display_nopause=true -var boot_nopause=true -var export_nopause=true -var version=$VERSION ./packer_templates
```