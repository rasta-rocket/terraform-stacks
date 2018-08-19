# Compute
variable "instance_name" {
  default = "bastion_server"
}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "ansible_group" {
  default = "bastion"
}

# Security Groups
variable "security_groups_list" {
  type    = "list"
  default = ["secgroup_infra"]
}

# Network
variable "public_ip" {}

variable "network_name" {
  default = "bastion_net"
}

variable "cidr" {
  default = "192.168.1.0/24"
}

variable "router_name" {
  default = "gateway"
}
