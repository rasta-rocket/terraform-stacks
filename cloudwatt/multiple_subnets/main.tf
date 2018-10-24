resource "openstack_networking_network_v2" "net" {
  name  = "${var.count > 1 ? format("%s_%d",var.network_name, count.index) : var.network_name}"
  count = "${var.count}"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id = "${element(openstack_networking_network_v2.net.*.id, count.index)}"
  cidr       = "${cidrsubnet(var.subnet_cidr, var.subnet_new_bits, count.index)}"
  count      = "${var.count}"
}
