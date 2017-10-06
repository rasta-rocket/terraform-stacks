module "vm_with_floatingip" {
	source = "../vm_with_floatingip"
	instance_name = "${var.instance_name}"
	image_name = "${var.image_name}"
	flavor_name = "${var.flavor_name}"
	key_pair = "${var.key_pair}"
	network_name = "${var.network_name}"
	cidr = "${var.cidr}"
        count = "${var.count}"
}
