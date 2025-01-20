

Fully automated build, provision and publish Vagrant box.

```bash
export HCP_CLIENT_ID=<id>
export HCP_CLIENT_SECRET=<secret>
packer build --only=utm-cloud.vm -var-file=os_pkrvars/debian/debian-12-aarch-cloud.pkrvars.hcl -var display_nopause=true -var boot_nopause=true -var export_nopause=true -var version=0.0.2 ./packer_templates
```

Build but don't publish
```bash
packer build --only=utm-cloud.vm -except=artifice,vagrant-registry -var-file=os_pkrvars/debian/debian-12-aarch64-cloud.pkrvars.hcl -var boot_nopause=true ./packer_templates
```