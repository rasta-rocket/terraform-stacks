module "vm_on_one_network" {
  source               = "../../base/vm_on_one_network"
  instance_name        = "${var.instance_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  ansible_group        = "${var.ansible_group}"
  security_groups_list = "${var.security_groups_list}"
  network_name         = "${var.network_name}"
  cidr                 = "${var.cidr}"
  count                = "${var.nb_instances}"
}

data "openstack_networking_router_v2" "router" {
  name = "${var.router_name}"
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = "${data.openstack_networking_router_v2.router.id}"
  subnet_id = "${module.vm_on_one_network.subnet_id}"
}
