# Building Ubuntu 

1. Get ISO

2. Update variable
```json
iso_url                 = "/Users/naveenrajm/Developer/UTMvagrant/isofiles/ubuntu-24.04.1-live-server-arm64.iso"
```

3.  Run Packer

```bash
PACKER_LOG=1 packer build --only=utm-iso.vm -var-file=os_pkrvars/ubuntu/ubuntu-24.04-aarch64.pkrvars.hcl ./packer_templates
```

4. Add Display for VNC

virtio-gpu-pci

5. Stop VM, Remove ISO, Start VM

