resource "openstack_networking_router_v2" "router" {
  name             = "${var.router_name}"
  external_gateway = "${var.ext_gw_net_id}"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${element(var.subnet_ids, count.index)}"
  count     = "${var.nb_subnet}"
}
