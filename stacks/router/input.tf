# Network
variable "router_name" {
  default = "router"
}

variable "network" {
  type = "list"
}

variable "count" {}

variable "secgroup_ids" {
  type = "list"
}
