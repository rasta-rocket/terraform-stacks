# Compute
variable "instances" {
  type = "list"
}

variable "image_name" {}
variable "key_pair" {}

# Security Groups
variable "security_groups_list" {
  type    = "list"
  default = ["default"]
}

# Network
variable "network_name" {
  default = "net"
}

variable "cidr" {
  default = "192.168.2.0/24"
}

variable "router_name" {}
