#data "openstack_networking_network_v2" "network" {
#	network_id = "${var.network}"
#	count = "${var.nb_network}"
#}

data "openstack_networking_subnet_v2" "subnet" {
	subnet_id = "${element(var.network, count.index)}"
	count = "${var.nb_network}"
}

resource "openstack_networking_router_v2" "router" {
  name = "${var.router_name}"
  external_gateway = "${var.external_gateway}"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${element(data.openstack_networking_subnet_v2.subnet.*.id, count.index)}"
  count     = "${var.nb_network}"
}
