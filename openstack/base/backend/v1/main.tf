module "backend" {
  source        = "../../vm_with_floatingip"
  instance_name = "${var.backend_name}"
  image_name    = "${var.image_name}"
  flavor_name   = "${var.flavor_name}"
  key_pair      = "${var.key_pair}"
  ansible_group = "${var.backend_ansible_group}"
  network_name  = "${var.backend_net}"
  cidr          = "${var.backend_cidr}"
  pool          = "${var.pool}"
  count         = "${var.count}"
}

module "bastion" {
  source        = "../../vm_with_floatingip"
  instance_name = "${var.bastion_name}"
  image_name    = "${var.image_name}"
  flavor_name   = "${var.flavor_name}"
  key_pair      = "${var.key_pair}"
  ansible_group = "${var.bastion_ansible_group}"
  network_name  = "${var.bastion_net}"
  cidr          = "${var.bastion_cidr}"
  pool          = "${var.pool}"
  count         = 1
}

resource "openstack_networking_router_v2" "router" {
  name = "${var.router_name}"
}

resource "openstack_networking_router_interface_v2" "router_interface_backend" {
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${module.backend.subnet_id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_bastion" {
  router_id = "${openstack_networking_router_v2.router.id}"
  subnet_id = "${module.bastion.subnet_id}"
}
