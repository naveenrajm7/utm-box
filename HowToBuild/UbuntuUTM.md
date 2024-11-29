


3.  Run Packer

```bash
PACKER_LOG=1 packer build --only=utm-utm.vm -var-file=os_pkrvars/ubuntu/ubuntu-24.04-aarch64.pkrvars.hcl ./packer_templates
```