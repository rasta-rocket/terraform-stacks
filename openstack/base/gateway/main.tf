data "openstack_networking_network_v2" "ext_net" {
  name = "${var.external_net}"
}

resource "openstack_networking_router_v2" "router" {
  name                = "${var.router_name}"
  external_network_id = "${data.openstack_networking_network_v2.ext_net.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${element(var.subnet_ids, count.index)}"
  count     = "${var.nb_subnet}"
}
