output "fip_address" {
	value = ["${openstack_networking_floatingip_v2.fip.*.address}"]
}
output "ip_address" {
        value = "${module.vm_with_single_network.ip_address}"
}
output "subnet_id" {
	value = "${module.vm_with_single_network.subnet_id}"
}
