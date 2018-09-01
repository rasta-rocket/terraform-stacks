# Compute
variable "instance_name" {
  default = "docker_server"
}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "ansible_group" {
  default = "docker"
}

# Network
variable "network_name" {
  default = "docker_net"
}

variable "cidr" {
  default = "10.15.3.0/24"
}

# Number of instances
variable "nb_instances" {
  default = "1"
}
