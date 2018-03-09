module "backend_v2" {
  source                  = "../../../base/backend/v2"
  image_name              = "${var.image_name}"
  flavor_name             = "${var.flavor_name}"
  key_pair                = "${var.key_pair}"
  backend_name            = "${var.backend_name}"
  backend_security_groups = "${list(module.security_group_ssh_icmp.secgroup_name, module.security_group_http.secgroup_name)}"
  backend_ansible_group   = "${var.backend_ansible_group}"
  bastion_name            = "${var.bastion_name}"
  bastion_security_groups = "${list(module.security_group_ssh_icmp.secgroup_name, module.security_group_http.secgroup_name)}"
  bastion_ansible_group   = "${var.bastion_ansible_group}"
  external_net            = "${var.external_net}"
  backend_net             = "${var.backend_net}"
  backend_cidr            = "${var.backend_cidr}"
  bastion_net             = "${var.bastion_net}"
  bastion_cidr            = "${var.bastion_cidr}"
  gateway_name            = "${var.gateway_name}"
  nb_backend              = "${var.nb_backend}"
}

module "security_group_ssh_icmp" {
  source        = "../../../base/security_group_ssh_icmp/v1"
  secgroup_name = "${var.security_group_ssh_icmp_name}"
}

module "security_group_http" {
  source        = "../../../base/security_group_http/v1"
  secgroup_name = "${var.security_group_http_name}"
}
