# Compute
variable instance_name {}
variable image_name {}
variable flavor_name {}
variable key_pair {}

# Network
variable network_name {
	default = "net_tf"
}
variable cidr {
	default = "192.168.10.0/24"
}
variable lb_network_name {
	default = "lb_net_tf"
}
variable lb_cidr {
	default = "192.168.20.0/24"
}

# Count
variable count {
        default = "1"
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
	default = "lb_pool_tf"
}

variable lb_vip_name {
	default = "lb_vip_tf"
}
