output "vip_subnet_id" {
	value = "${openstack_networking_subnet_v2.vip_subnet.id}"
}

output "vip_address" {
	value = "${openstack_lb_vip_v1.vip.address}"
}

output "backend_address" {
	value = "${var.members_ip}"
}
