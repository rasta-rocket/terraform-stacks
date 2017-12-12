# Default
variable image_name {}
variable flavor_name {}
variable key_pair {}

# Backend
variable backend_name {
	default = "backend"
}
variable backend_ansible_group {
	default = "backend_group"
}

# Bastion
variable bastion_name {
	default = "bastion"
}
variable bastion_ansible_group {
	default = "bastion_group"
}

# Network
variable public_net {
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
variable router_name {
	default = "router"
}
variable snat_name {
	default = "snat"
}

# Count (number of backend)
variable count {
	default = "1"
}
