packer {
  required_plugins {
    utm = {
      version = ">=v0.0.1"
      source  = "github.com/naveenrajm7/utm"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}

# Prepare the UTM VM with vagrant user
# So it can run other vagrant specific tasks as vagrant user
source "utm-utm" "prepare" {
  source_path = "/Users/naveenrajm/Developer/UTMvagrant/utm_gallery/Debian11G.utm"
  vm_name = "Debian11G"
  ssh_username = "debian"
  ssh_password = "debian"
  shutdown_command = "echo 'debian' | sudo -S /sbin/halt -h -p"
  keep_registered = true
}

build {
  sources = [
    "source.utm-utm.prepare"
  ]

  // Use the ssh user from UTM VM, to add vagrant user
  // ideally this should be added in auto install script
  // We use 'vagrant' user to run other vagrant specific tasks
  provisioner "shell" {
    script= "${path.root}/packer_templates/scripts/_common/add-vagrant-user.sh"
    execute_command = "echo 'debian' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
  }

  //  if you want to run ansible playbook
  //   provisioner "ansible" {
  //   playbook_file = "./playbook.yml"
  //   extra_arguments = [ "--scp-extra-args", "'-O'" , "--ask-become-pass"]
  // }

}
