# Compute
variable "instance_name" {}

variable "image_name" {}
variable "flavor_name" {}
variable "key_pair" {}

variable "security_groups_list" {
  type    = "list"
  default = ["default"]
}

variable "ansible_group" {
  default = "default_group"
}

# Network
variable "pool" {
  default = "public"
}

variable "network_name" {
  default = "net_tf"
}

variable "cidr" {
  default = "192.168.10.0/24"
}

# Count
variable "count" {
  default = "1"
}
