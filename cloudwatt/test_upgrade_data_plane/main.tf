module "backend" {
  source               = "../../openstack/base/cluster_az/v2"
  instance_name        = "${var.backend_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  compute_nodes        = "${var.compute_nodes}"
  security_groups_list = "${list(module.security_group_ssh_icmp.secgroup_name, module.security_group_http.secgroup_name, openstack_compute_secgroup_v2.security_group_tcp_test.name)}"
  ansible_group        = "${var.backend_ansible_group}"
  network_name         = "${var.backend_net}"
  cidr                 = "${var.backend_cidr}"
  count                = "${var.nb_backend}"
}

module "bastion" {
  source               = "../../openstack/base/vm_with_floatingip"
  instance_name        = "${var.bastion_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${list(module.security_group_ssh_icmp.secgroup_name, module.security_group_http.secgroup_name, openstack_compute_secgroup_v2.security_group_tcp_test.name)}"
  ansible_group        = "${var.bastion_ansible_group}"
  network_name         = "${var.bastion_net}"
  cidr                 = "${var.bastion_cidr}"
  pool                 = "${var.external_net}"
  count                = 1
}

module "lbaas" {
  source           = "../../openstack/base/lbaas"
  members_ip       = "${module.backend.ip_address}"
  nb_members       = "${var.nb_backend}"
  members_subnet   = "${module.backend.subnet_id}"
  vip_network_name = "${var.vip_net}"
  vip_net_cidr     = "${var.vip_cidr}"
  lb_port          = "${var.lb_port}"
  lb_protocol      = "${var.lb_protocol}"
  lb_method        = "${var.lb_method}"
  lb_provider      = "${var.lb_provider}"
  lb_pool_name     = "${var.lb_pool_name}"
  lb_vip_name      = "${var.lb_vip_name}"
}

module "gateway" {
  source       = "../../openstack/base/gateway"
  router_name  = "${var.gateway_name}"
  subnet_ids   = "${list(module.backend.subnet_id, module.bastion.subnet_id, module.lbaas.vip_subnet_id)}"
  nb_subnet    = "3"
  external_net = "${var.external_net}"
}

module "security_group_ssh_icmp" {
  source        = "../../openstack/base/security_group_ssh_icmp/v1"
  secgroup_name = "${var.security_group_ssh_icmp_name}"
}

module "security_group_http" {
  source        = "../../openstack/base/security_group_http/v1"
  secgroup_name = "${var.security_group_http_name}"
}

resource "openstack_compute_secgroup_v2" "security_group_tcp_test" {
  name        = "${var.security_group_tcp_test_name}"
  description = "Allow traffic on port 8000 and 7000 (TCP test)"

  rule {
    from_port   = "8000"
    to_port     = "8000"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = "7000"
    to_port     = "7000"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
