module "vm_on_one_network" {
  source               = "../../vm_on_one_network"
  instance_name        = "${var.instance_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${var.security_groups_list}"
  ansible_group        = "${var.ansible_group}"
  network_name         = "${var.network_name}"
  cidr                 = "${var.cidr}"
}

data "openstack_networking_floatingip_v2" "fip" {
  address = "${var.floatingip_address}"
}

resource "openstack_compute_floatingip_associate_v2" "assoc_fip" {
  floating_ip = "${data.openstack_networking_floatingip_v2.fip.address}"
  instance_id = "${module.vm_on_one_network.instance_id[0]}"
}
