module "backend" {
  source        = "../../vm_on_one_network"
  instance_name = "${var.backend_name}"
  image_name    = "${var.image_name}"
  flavor_name   = "${var.flavor_name}"
  key_pair      = "${var.key_pair}"
  ansible_group = "${var.backend_ansible_group}"
  network_name  = "${var.backend_net}"
  cidr          = "${var.backend_cidr}"
  count         = "${var.nb_backend}"
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
  pool          = "${var.external_net}"
  count         = "1"
}

module "gateway" {
  source      = "../../gateway"
  router_name = "${var.gateway_name}"
  subnet_ids  = "${list(module.backend.subnet_id, module.bastion.subnet_id)}"
  nb_subnet   = "2"
  ext_gw_net  = "${var.external_net}"
}
