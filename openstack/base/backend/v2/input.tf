# Default
variable image_name {}

variable flavor_name {}
variable key_pair {}

# Backend
variable backend_name {
  default = "backend_server"
}

variable backend_ansible_group {
  default = "backend"
}

# Bastion
variable bastion_name {
  default = "bastion_server"
}

variable bastion_ansible_group {
  default = "bastion"
}

# Network
variable external_net {
  default = "public"
}

variable backend_net {
  default = "backend_net"
}

variable backend_cidr {
  default = "192.168.20.0/24"
}

variable bastion_net {
  default = "bastion_net"
}

variable bastion_cidr {
  default = "192.168.2.0/24"
}

# Router
variable gateway_name {
  default = "gateway"
}

# Count (number of backend)
variable nb_backend {
  default = "1"
}
