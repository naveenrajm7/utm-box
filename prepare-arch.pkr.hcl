packer {
  required_plugins {
    utm = {
      version = ">=v0.0.1"
      source  = "github.com/naveenrajm7/utm"
    }
  }
}

# Prepare the UTM VM with vagrant user
# So it can run other vagrant specific tasks as vagrant user
source "utm-utm" "prepare" {
  source_path      = "/Users/naveenrajm/Developer/UTMvagrant/utm_gallery/ArchLinux.utm"
  vm_name          = "ArchLinux"
  ssh_username     = "root"
  ssh_password     = "root"
  shutdown_command = "echo 'root' | /sbin/halt -h -p"
  keep_registered  = true
}

build {
  sources = [
    "source.utm-utm.prepare"
  ]

  // Use the ssh user from UTM VM, to add vagrant user
  // ideally this should be added in auto install script
  // We use 'vagrant' user to run other vagrant specific tasks
  provisioner "shell" {
    script          = "${path.root}/packer_templates/scripts/arch/add-vagrant-user.sh"
    execute_command = "echo 'root' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
  }

}
