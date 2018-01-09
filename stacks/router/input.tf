# Network
variable "router_name" {
  default = "router"
}

variable "network_ids" {
  type = "list"
}

variable "nb_network" {}

variable "secgroup_ids" {
  type = "list"
}
