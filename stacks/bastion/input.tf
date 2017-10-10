# Compute
variable instance_name {
	default = "bastion"
}
variable image_name {}
variable flavor_name {}
variable key_pair {}

# Network
variable pool {
	default = "public"
}
variable network_name {
        default = "bastion_net_tf"
}
variable cidr {
        default = "192.168.1.0/24"
}

# Count
variable count {
        default = "1"
}
