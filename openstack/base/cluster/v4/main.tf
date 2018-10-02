module "cluster_v2" {
  source               = "../v2"
  instances            = "${var.instances}"
  image_name           = "${var.image_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${var.security_groups_list}"
  network_name         = "${var.network_name}"
  cidr                 = "${var.cidr}"
}

data "openstack_networking_router_v2" "router" {
  name = "${var.router_name}"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = "${data.openstack_networking_router_v2.router.id}"
  subnet_id = "${module.cluster_v2.subnet_id}"
}
