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

source "utm-iso" "vm" {
  iso_url = var.iso_url
  iso_checksum = var.iso_checksum
  vm_arch = "${var.os_arch}"
  vm_backend = "qemu"

  boot_command = var.boot_command

  http_directory = var.http_directory == null ? "${path.root}/http" : var.http_directory

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  shutdown_command = local.shutdown_command
  keep_registered = var.keep_registered
}