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
variable count {
	default = "2"
}

# Bastion
variable bastion_name {
	default = "bastion"
}
variable bastion_ansible_group {
	default = "bastion_group"
}

# Network
variable pool {
	default = "public"
}
variable backend_net {
        default = "backend_net"
}
variable backend_cidr {
        default = "192.168.10.0/24"
}
variable bastion_net {
        default = "bastion_net"
}
variable bastion_cidr {
        default = "192.168.1.0/24"
}
variable vip_net {
	default = "lb_vip_net"
}
variable vip_cidr {
	default = "192.168.20.0/24"
}

# Router
variable router_name {
	default = "router"
}
variable snat_name {
	default = "snat"
}

# LBaaS
variable lb_port {
        default = "80"
}

variable lb_protocol {
	default = "HTTP"
}

variable lb_method {
	default = "ROUND_ROBIN"
}

variable lb_provider {
	default = "haproxy"
}

variable lb_pool_name {
	default = "lb_pool"
}

variable lb_vip_name {
	default = "lb_vip"
}
