# Default
variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

# Analyzer
variable "docker_name" {
  default = "docker_server"
}

variable "docker_ansible_group" {
  default = "docker"
}

variable "nb_docker" {
  default = "1"
}

# Security Group
variable "security_group_ssh_icmp_name" {
  default = "docker_security_group_ssh_icmp"
}

# Docker Ports
variable "docker_api_port" {
	default = "2376"
}

# Network
variable "external_net" {
  default = "public"
}

variable "docker_net" {
  default = "docker_net"
}

variable "docker_cidr" {
  default = "192.168.80.0/24"
}
