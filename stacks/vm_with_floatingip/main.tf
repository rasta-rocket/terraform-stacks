module "vm_with_single_network" {
	source = "../vm_with_single_network"
	instance_name = "${var.instance_name}"
	image_name = "${var.image_name}"
	flavor_name = "${var.flavor_name}"
	key_pair = "${var.key_pair}"
	network_name = "${var.network_name}"
	cidr = "${var.cidr}"
        count = "${var.count}"
}

resource "openstack_networking_floatingip_v2" "fip" {
	pool = "public"
	count = "${var.count}"
}

resource "openstack_compute_floatingip_associate_v2" "assoc_fip" {
	floating_ip = "${element(openstack_networking_floatingip_v2.fip.*.address, count.index)}"
	instance_id = "${element(module.vm_with_single_network.instances_id, count.index)}"
	count = "${var.count}"
}
