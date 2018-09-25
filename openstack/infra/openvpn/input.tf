# Compute
variable "instance_name" {
  default = "vpn_server"
}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "ansible_group" {
  default = "vpn"
}

# Security Groups
variable "security_groups_list" {
  type    = "list"
  default = ["secgroup_infra"]
}

# Network
variable "public_ip" {}

variable "network_name" {
  default = "vpn_net"
}

variable "cidr" {
  default = "10.15.2.0/24"
}

variable "router_name" {
  default = "gateway"
}
