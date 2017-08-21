output "ip_address" {
	value = ["${openstack_compute_instance_v2.instance.*.access_ip_v4}"]
}
