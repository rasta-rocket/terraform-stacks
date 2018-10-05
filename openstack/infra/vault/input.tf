# Compute
variable "instance_name" {
  default = "vault_server"
}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "ansible_group" {
  default = "vault"
}

# Network
variable "network_name" {
  default = "vault_net"
}

variable "cidr" {
  default = "10.15.4.0/24"
}

variable "router_name" {
  default = "gateway"
}

# Number of instances
variable "nb_instances" {
  default = "1"
}
