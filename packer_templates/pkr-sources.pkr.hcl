locals {
  # Source block provider specific
  # utm-utm
  utm_source_path = "/Users/naveenrajm/Developer/UTMvagrant/utm_box/output-prepare/Debian11G.utm"
  utm_vm_name = "Debian11G"
  shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"

}

source "utm-utm" "vm" {
  source_path = local.utm_source_path
  vm_name = local.utm_vm_name
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  shutdown_command = local.shutdown_command
  keep_registered = var.keep_registered

}