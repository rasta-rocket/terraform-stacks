# Network
variable "network_name" {
  default = "net"
}

variable "subnet_cidr" {
  default = "10.0.0.0/8"
}

variable "subnet_new_bits" {
  default = "8"
}

# Count
variable "count" {
  default = "2"
}
