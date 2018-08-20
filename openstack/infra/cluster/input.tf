# Compute
variable "instance_name" {
  default = "cluster_server"
}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "ansible_group" {
  default = "cluster"
}

# Security Groups
variable "security_groups_list" {
  type    = "list"
  default = ["secgroup_infra"]
}

# Network
variable "network_name" {
  default = "cluster_net"
}

variable "cidr" {
  default = "192.168.2.0/24"
}

variable "router_name" {
  default = "gateway"
}

# Number of instances
variable "nb_instances" {
  default = "1"
}
