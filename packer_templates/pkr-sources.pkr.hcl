locals {
  # Source block provider specific
  # utm-utm
  # utm_source_path = "/Users/naveenrajm/Developer/UTMvagrant/utm_box/output-prepare/Debian11G.utm"
  # utm_vm_name = "Debian11G"

  # utm-iso
  uefi_boot = var.uefi_boot == null ? (
    var.is_windows ? true : false
  ) : var.uefi_boot

  guest_additions_mode = var.guest_additions_mode == null ? (
  var.is_windows ? "attach" : "upload"
  ) : var.guest_additions_mode

  # Source block common
  default_boot_wait = var.default_boot_wait == null ? (
    var.is_windows ? "60s" : (
      var.os_name == "macos" ? "8m" : "5s"
    )
  ) : var.default_boot_wait

  cd_files = var.cd_files == null ? (
    var.is_windows ? (
      var.os_arch == "x86_64" ? [
        "${path.root}/win_answer_files/${var.os_version}/Autounattend.xml",
        ] : [
        "${path.root}/win_answer_files/${var.os_version}/arm64/Autounattend.xml",
      ]
    ) : null
  ) : var.cd_files

  communicator = var.communicator == null ? (
    var.is_windows ? "winrm" : "ssh"
  ) : var.communicator

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
  # UTM specific options
  vm_arch = "${var.os_arch}"
  vm_backend = "qemu"
  uefi_boot = local.uefi_boot
  hypervisor = var.hypervisor
  hard_drive_interface = var.hard_drive_interface
  iso_interface = var.iso_interface

  # Source block common options
  iso_url = var.iso_url
  iso_checksum = var.iso_checksum

  memory = var.memory

  boot_command = var.boot_command
  boot_wait = var.boot_wait == null ? local.default_boot_wait : var.boot_wait


  // Path to a directory to serve using an HTTP server
  http_directory = var.http_directory == null ? "${path.root}/http" : var.http_directory

  communicator         = local.communicator
  cd_files             = local.cd_files
  guest_additions_mode = local.guest_additions_mode

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = var.ssh_timeout

  winrm_password   = var.winrm_password
  winrm_timeout    = var.winrm_timeout
  winrm_username   = var.winrm_username

  disable_vnc = var.disable_vnc

  shutdown_command = var.shutdown_command
  keep_registered = var.keep_registered

  # Skip the pause steps during build
  display_nopause = var.display_nopause
  boot_nopause    = var.boot_nopause
  export_nopause  = var.export_nopause


  output_directory = var.output_directory
}

source "utm-cloud" "vm" {
  iso_url = var.iso_url
  iso_checksum = var.iso_checksum
  vm_arch = "${var.os_arch}"
  vm_backend = "qemu"
  uefi_boot = local.uefi_boot
  hypervisor = var.hypervisor
  memory = var.memory
  disk_size = var.disk_size
  vm_name = "vagrant-${var.os_name}-${var.os_version}-${var.os_arch}-${formatdate("YYYY-MM-DD_hhmmss_ZZZ", timestamp())}"

  // Path to a directory to serve using an HTTP server
  // Required to launch http server
  http_directory = var.http_directory == null ? "${path.root}/http/${var.os_name}-cloud/" : var.http_directory

  // Required to use CD as a source for cloud-init, default source is http
  use_cd = true 
  // Required to pass the cloud-init file as a cd file
  cd_files             = local.cd_files
  // Required to for cloud-init to identify the cd file
  cd_label             = "cidata"
  // Required to resize the cloud image
  resize_cloud_image = true

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = var.ssh_timeout

  # Skip the pause steps during build
  display_nopause = var.display_nopause
  boot_nopause    = var.boot_nopause
  export_nopause  = var.export_nopause

  shutdown_command = var.shutdown_command
  keep_registered = var.keep_registered
}