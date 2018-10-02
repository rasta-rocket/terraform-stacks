# Compute
variable "instance_name" {
  default = "server"
}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "ansible_group" {
  default = "default"
}

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

# Number of instances
variable "nb_instances" {
  default = "1"
}
