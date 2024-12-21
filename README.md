# UTM box

Packer templates to build Vagrant compatible UTM boxes,
which can be used with Vagrant using [Vagrant UTM plugin](https://naveenrajm7.github.io/vagrant_utm)


## Building Boxes

#### Requirements
* Packer
* UTM
* UTM packer plugin (packer init will install)

#### Examples 

To build a OpenBSD 7.8 box with UTM provider ISO builder (utm-iso)

```bash
packer init packer_templates
packer build --only=utm-iso.vm -var-file=os_pkrvars/openbsd/openbsd-7.6-aarch64.pkrvars.hcl ./packer_templates
```

To build Debian box using cloud image with UTM provider cloud builder (utm-cloud)

```bash
packer build --only=utm-cloud.vm -var-file=os_pkrvars/debian/debian-12-aarch64-cloud.pkrvars.hcl ./packer_templates
```



