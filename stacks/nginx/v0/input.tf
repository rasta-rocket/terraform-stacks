# Compute
variable "instance_name" {
  default = "nginx_server"
}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "ansible_group" {
  default = "nginx"
}

# Network
variable "pool" {
  default = "public"
}

variable "network_name" {
  default = "nginx_net"
}

variable "cidr" {
  default = "192.168.10.0/24"
}

# Count
variable "count" {
  default = "1"
}
