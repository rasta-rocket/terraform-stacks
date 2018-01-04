# Default
variable "image_name" {}

variable "flavor_name" {}
variable "key_pair" {}

# Backend
variable "backend_name" {
  default = "nginx_server"
}

variable "backend_ansible_group" {
  default = "nginx"
}

# Bastion
variable "bastion_name" {
  default = "bastion_server"
}

variable "bastion_ansible_group" {
  default = "bastion"
}

# Network
variable "pool" {
  default = "public"
}

variable "backend_net" {
  default = "nginx_net"
}

variable "backend_cidr" {
  default = "192.168.10.0/24"
}

variable "bastion_net" {
  default = "bastion_net"
}

variable "bastion_cidr" {
  default = "192.168.1.0/24"
}

# Router
variable "router_name" {
  default = "router_nginx_bastion"
}

# Count (number of backend)
variable "count" {
  default = "1"
}
