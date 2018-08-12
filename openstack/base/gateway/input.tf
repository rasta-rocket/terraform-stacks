# Network
variable "router_name" {
  default = "router"
}

variable "subnet_ids" {
  type = "list"
}

variable "nb_subnet" {}

variable "external_net" {
  default = "public"
}
