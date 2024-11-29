# General variables
variable "os_name" {
  type        = string
  description = "OS Brand Name"
}

variable "os_version" {
  type        = string
  description = "OS version number"
}

variable "os_arch" {
  type = string
  validation {
    condition     = var.os_arch == "x86_64" || var.os_arch == "aarch64"
    error_message = "The OS architecture type should be either x86_64 or aarch64."
  }
  description = "OS architecture type, x86_64 or aarch64"
}

variable "keep_registered" {
  type    = bool
  default = true
}

variable "is_windows" {
  type        = bool
  default     = false
  description = "Determines to set setting for Windows or Linux"
}
variable "http_proxy" {
  type        = string
  default     = env("http_proxy")
  description = "Http proxy url to connect to the internet"
}
variable "https_proxy" {
  type        = string
  default     = env("https_proxy")
  description = "Https proxy url to connect to the internet"
}
variable "no_proxy" {
  type        = string
  default     = env("no_proxy")
  description = "No Proxy"
}

variable "sources_enabled" {
  type = list(string)
  default = [
    "source.utm-iso.vm",
    "source.utm-utm.vm"
  ]
  description = "Build Sources to use for building vagrant boxes"
}

# Source block common variables
variable "boot_command" {
  type        = list(string)
  default     = null
  description = "Commands to pass to gui session to initiate automated install"
}

variable "default_boot_wait" {
  type    = string
  default = null
}

variable "cd_files" {
  type    = list(string)
  default = null
}

variable "cpus" {
  type    = number
  default = 2
}

variable "communicator" {
  type    = string
  default = null
}

variable "disk_size" {
  type    = number
  default = 65536
}

variable "floppy_files" {
  type    = list(string)
  default = null
}

variable "http_directory" {
  type    = string
  default = null
}

variable "iso_checksum" {
  type        = string
  default     = null
  description = "ISO download checksum"
}

variable "iso_url" {
  type        = string
  default     = null
  description = "ISO download url"
}

variable "memory" {
  type    = number
  default = null
}

variable "ssh_username" {
  type    = string
  default = "vagrant"
}

variable "ssh_password" {
  type    = string
  default = "vagrant"
}

# utm-utm 
variable "utm_source_path" {
  type        = string
  description = "Path to the UTM VM file"
}

variable "utm_vm_name" {
  type        = string
  description = "Name of the UTM VM"
}

variable "shutdown_command" {
  type        = string
  description = "Command to shutdown the VM"
}

# builder common block
variable "scripts" {
  type    = list(string)
  default = null
}

