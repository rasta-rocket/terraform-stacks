resource "openstack_networking_floatingip_v2" "fip" {
	pool = "public" 
}

resource "openstack_compute_floatingip_associate_v2" "assoc_fip" {
	floating_ip = "${openstack_networking_floatingip_v2.fip.address}"
	instance_id = "${openstack_compute_instance_v2.instance.id}"
}

resource "openstack_compute_instance_v2" "instance" {
	name = "${var.instance_name}"
	image_name = "${var.image_name}"
	flavor_name = "${var.flavor_name}"
	key_pair = "${var.key_pair}"
	security_groups = ["default"]

	network {
		name = "${var.network_name}"
	}
}
