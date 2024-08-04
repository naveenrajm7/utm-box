# General variables
variable "os_name" {
  type        = string
  description = "OS Brand Name"
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
    "source.utm-utm.vm",
  ]
  description = "Build Sources to use for building vagrant boxes"
}

# Source block common variables
variable "ssh_username" {
  type    = string
  default = "vagrant"
}

variable "ssh_password" {
  type    = string
  default = "vagrant"
}

# builder common block
variable "scripts" {
  type    = list(string)
  default = null
}