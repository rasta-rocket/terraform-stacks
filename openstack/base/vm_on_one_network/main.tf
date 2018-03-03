resource "openstack_networking_network_v2" "net" {
  name = "${var.network_name}"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id = "${openstack_networking_network_v2.net.id}"
  cidr       = "${var.cidr}"
}

resource "openstack_compute_instance_v2" "instance" {
  name            = "${var.instance_name}_${count.index}"
  image_name      = "${var.image_name}"
  flavor_name     = "${var.flavor_name}"
  key_pair        = "${var.key_pair}"
  security_groups = "${var.security_groups_list}"

  network {
    name = "${openstack_networking_network_v2.net.name}"
  }

  metadata {
    ansible_group = "${var.ansible_group}"
  }

  count = "${var.count}"
}
