# Network
variable "router_name" {
  default = "router"
}

variable "subnet_ids" {
  type = "list"
}

variable "nb_subnet" {}

variable "ext_gw_net" {
  default = ""
}
