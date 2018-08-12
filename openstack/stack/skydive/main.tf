module "analyzer" {
  source               = "../../base/vm_on_one_network"
  instance_name        = "${var.analyzer_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${list(module.security_group_ssh_icmp.secgroup_name, openstack_compute_secgroup_v2.skydive_secgroup.name)}"
  ansible_group        = "${var.analyzer_ansible_group}"
  network_name         = "${var.analyzer_net}"
  cidr                 = "${var.analyzer_cidr}"
  count                = "${var.nb_analyzer}"
}

module "agent" {
  source               = "../../base/vm_on_one_network"
  instance_name        = "${var.agent_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${list(module.security_group_ssh_icmp.secgroup_name, openstack_compute_secgroup_v2.skydive_secgroup.name)}"
  ansible_group        = "${var.agent_ansible_group}"
  network_name         = "${var.agent_net}"
  cidr                 = "${var.agent_cidr}"
  count                = "${var.nb_agent}"
}

module "bastion" {
  source               = "../../base/vm_with_floatingip"
  instance_name        = "${var.bastion_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${list(module.security_group_ssh_icmp.secgroup_name)}"
  ansible_group        = "${var.bastion_ansible_group}"
  network_name         = "${var.bastion_net}"
  cidr                 = "${var.bastion_cidr}"
  pool                 = "${var.external_net}"
  count                = "1"
}

module "gateway" {
  source       = "../../base/gateway"
  router_name  = "${var.gateway_name}"
  subnet_ids   = "${list(module.analyzer.subnet_id, module.agent.subnet_id, module.bastion.subnet_id)}"
  nb_subnet    = "3"
  external_net = "${var.external_net}"
}

module "security_group_ssh_icmp" {
  source        = "../../base/security_group_ssh_icmp/v1"
  secgroup_name = "${var.security_group_ssh_icmp_name}"
}
