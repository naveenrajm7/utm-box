packer {
  required_plugins {
    utm = {
      version = ">=v0.0.2"
      source  = "github.com/naveenrajm7/utm"
    }
  }
}

locals {
  scripts = var.scripts == null ? (
    var.os_name == "ubuntu" || var.os_name == "debian" ? [
      "${path.root}/scripts/${var.os_name}/update_${var.os_name}.sh",
      "${path.root}/scripts/_common/sshd.sh",
      "${path.root}/scripts/${var.os_name}/sudoers_${var.os_name}.sh",
      "${path.root}/scripts/_common/vagrant.sh",
      "${path.root}/scripts/_common/utm.sh",
      "${path.root}/scripts/${var.os_name}/cleanup_${var.os_name}.sh",
    ] : (
      var.os_name == "arch" ? [
        "${path.root}/scripts/${var.os_name}/update_${var.os_name}.sh",
        "${path.root}/scripts/_common/sshd.sh",
        "${path.root}/scripts/${var.os_name}/sudoers_${var.os_name}.sh",
        "${path.root}/scripts/_common/vagrant.sh",
        "${path.root}/scripts/_common/utm.sh",
      ] : [] // add more os here
    )
  ) : var.scripts

  source_names = [for source in var.sources_enabled : trimprefix(source, "source.")]
}

build {
  sources = var.sources_enabled

  provisioner "shell" {
    environment_vars = [
      "HOME_DIR=/home/vagrant",
        "http_proxy=${var.http_proxy}",
        "https_proxy=${var.https_proxy}",
        "no_proxy=${var.no_proxy}"
      ]
  
    execute_command   = "echo 'vagrant' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
    expect_disconnect = true
    scripts           = local.scripts
    except            = var.is_windows ? local.source_names : null
  }

  // compress does not compress directories, only files
  // but our output UTM VM is a directory, so we need to
  // compress it into a zip file using custom post-processor
  post-processor "utm-zip" {
    output = "{{.BuildName}}_vagrant_utm.zip"
    keep_input_artifact = true
  }

  # Convert machines to vagrant boxes
  # post-processor "vagrant" {
  #   compression_level = 9
  #   output            = "${path.root}/../builds/${var.os_name}-${var.os_version}-${var.os_arch}.{{ .Provider }}.box"
  #   vagrantfile_template = var.is_windows ? "${path.root}/vagrantfile-windows.template" : (
  #     var.os_name == "freebsd" ? "${path.root}/vagrantfile-freebsd.template" : null
  #   )
  # }
}