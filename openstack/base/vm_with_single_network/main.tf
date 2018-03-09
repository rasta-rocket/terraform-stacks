resource "openstack_networking_network_v2" "net" {
  name  = "${var.network_name}_${count.index}"
  count = "${var.count}"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id = "${element(openstack_networking_network_v2.net.*.id, count.index)}"
  cidr       = "${var.cidr}"
  count      = "${var.count}"
}

resource "openstack_compute_instance_v2" "instance" {
  name            = "${var.instance_name}_${count.index}"
  image_name      = "${var.image_name}"
  flavor_name     = "${var.flavor_name}"
  key_pair        = "${var.key_pair}"
  security_groups = ["default"]

  network {
    name = "${element(openstack_networking_network_v2.net.*.name, count.index)}"
  }

  metadata {
    ansible_group = "${var.ansible_group}"
  }

  count = "${var.count}"
}
