locals {
  # Source block provider specific
  # utm-utm
  # utm_source_path = "/Users/naveenrajm/Developer/UTMvagrant/utm_box/output-prepare/Debian11G.utm"
  # utm_vm_name = "Debian11G"
  # shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
  # Source block common
  default_boot_wait = var.default_boot_wait == null ? "10s" : var.default_boot_wait

}

source "utm-utm" "vm" {
  source_path = var.utm_source_path
  vm_name = var.utm_vm_name
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  shutdown_command = var.shutdown_command
  keep_registered = var.keep_registered

  output_directory = var.output_directory

}

source "utm-iso" "vm" {
  iso_url = var.iso_url
  iso_checksum = var.iso_checksum
  vm_arch = "${var.os_arch}"
  vm_backend = "qemu"

  memory = var.memory

  boot_command = var.boot_command
  boot_wait = var.boot_wait == null ? local.default_boot_wait : var.boot_wait

  // Path to a directory to serve using an HTTP server
  http_directory = var.http_directory == null ? "${path.root}/http" : var.http_directory

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = var.ssh_timeout
  shutdown_command = var.shutdown_command
  keep_registered = var.keep_registered

  output_directory = var.output_directory
}