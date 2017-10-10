output "fip_address" {
	value = "${module.vm_with_floatingip.fip_address}"
}

output "ip_address" {
        value = "${module.vm_with_floatingip.ip_address}"
}
