output "vip_address" {
	value = "${openstack_lb_vip_v1.vip.address}"
}

output "backend_address" {
	value = "${module.vm_on_one_network.ip_address}"
}
