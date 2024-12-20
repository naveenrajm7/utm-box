packer {
  required_plugins {
    utm = {
      version = ">=v0.0.2"
      source  = "github.com/naveenrajm7/utm"
    }
  }
}

variable "hcp_client_id" {
  type    = string
  default = "${env("HCP_CLIENT_ID")}"
}

variable "hcp_client_secret" {
  type    = string
  default = "${env("HCP_CLIENT_SECRET")}"
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
      ] : (
      var.os_name == "openbsd" ? [
          "${path.root}/scripts/${var.os_name}/doas_${var.os_name}.sh",
        ] : []
      )
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
  
    execute_command   = ( 
      var.os_name == "openbsd" ? "echo 'vagrant' | {{.Vars}} su -m root -c 'sh -eux {{.Path}}'" : 
      "echo 'vagrant' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
    )
    expect_disconnect = true
    scripts           = local.scripts
    except            = var.is_windows ? local.source_names : null
  }

  // compress does not compress directories, only files
  // but our output UTM VM is a directory, so we need to
  // compress it into a zip file using custom post-processor
  # post-processor "utm-zip" {
  #   output = "{{.BuildName}}_vagrant_utm.zip"
  #   keep_input_artifact = true
  # }

  # Convert machines to vagrant boxes
  post-processor "utm-vagrant" {
    compression_level = 9
    output            = "${path.root}/../builds/${var.os_name}-${var.os_version}.box"
    vagrantfile_template = var.is_windows ? "${path.root}/vagrantfile-windows.template" : (
      var.os_name == "freebsd" ? "${path.root}/vagrantfile-freebsd.template" : null
    )
  }

  # To feed artifact to 'vagrant-registry' post-processor
  # from 'artifice' post-processor, we keep both in post-processors block
  post-processors {
    # 'vagrant-registry' post-processor only works for specific artifacts
    # this post-processor requires an input artifact from the 
    # artifice post-processor, vagrant post-processor, or vagrant builder
    # so we need to use 'artifice' post-processor to create an artifact
    post-processor "artifice" {
      files = ["${path.root}/../builds/${var.os_name}-${var.os_version}.box"]
    }

    # Upload the box to Vagrant Registry
    post-processor "vagrant-registry" {
      client_id     = "${var.hcp_client_id}"
      client_secret = "${var.hcp_client_secret}"
      box_tag       = "utm/${var.os_name}-${var.os_version}"
      version       = "${var.version}"
      architecture  = "arm64"
    }
  }
  
}