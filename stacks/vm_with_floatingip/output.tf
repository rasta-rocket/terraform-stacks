output "fip_address" {
	value = "${openstack_compute_floatingip_associate_v2.assoc_fip.floating_ip}"
}
