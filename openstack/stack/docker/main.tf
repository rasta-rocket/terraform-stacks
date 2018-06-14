module "docker" {
  source               = "../../base/vm_with_floatingip"
  instance_name        = "${var.docker_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${list(module.security_group_ssh_icmp.secgroup_name, openstack_compute_secgroup_v2.docker_secgroup.name)}"
  ansible_group        = "${var.docker_ansible_group}"
  network_name         = "${var.docker_net}"
  cidr                 = "${var.docker_cidr}"
  pool                 = "${var.external_net}"
  count                = "${var.nb_docker}"
}

module "security_group_ssh_icmp" {
  source        = "../../base/security_group_ssh_icmp/v1"
  secgroup_name = "${var.security_group_ssh_icmp_name}"
}
