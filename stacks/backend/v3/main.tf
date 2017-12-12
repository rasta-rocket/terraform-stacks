module "backend" {
	source = "../../vm_on_one_network"
	instance_name = "${var.backend_name}"
	image_name = "${var.image_name}"
	flavor_name = "${var.flavor_name}"
	key_pair = "${var.key_pair}"
	ansible_group = "${var.backend_ansible_group}"
	network_name = "${var.backend_net}"
	cidr = "${var.backend_cidr}"
        count = "${var.count}"
}

module "bastion" {
	source = "../../bastion"
	instance_name = "${var.bastion_name}"
	image_name = "${var.image_name}"
	flavor_name = "${var.flavor_name}"
	key_pair = "${var.key_pair}"
	ansible_group = "${var.bastion_ansible_group}"
	network_name = "${var.bastion_net}"
	cidr = "${var.bastion_cidr}"
	pool = "${var.pool}"
        count = 1
}

module "lbaas" {
	source = "../../lbaas"
	members_ip = "${module.backend.ip_address}"
	nb_members = "${var.count}"
	members_subnet = "${module.backend.subnet_id}"
	vip_network_name = "${var.vip_net}"
	vip_net_cidr = "${var.vip_cidr}"
	lb_port = "${var.lb_port}"
	lb_protocol = "${var.lb_protocol}"
	lb_method = "${var.lb_method}"
	lb_provider = "${var.lb_provider}"
	lb_pool_name = "${var.lb_pool_name}"
	lb_vip_name = "${var.lb_vip_name}"

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

resource "openstack_networking_router_interface_v2" "router_interface_vip" {
	router_id = "${openstack_networking_router_v2.router.id}"
	subnet_id = "${module.lbaas.vip_subnet_id}"
}

data "openstack_networking_network_v2" "public_net" {
	  name = "${var.pool}"
}

resource "openstack_networking_router_v2" "snat" {
  name = "${var.snat_name}"
  external_gateway = "${data.openstack_networking_network_v2.public_net.id}"
}

resource "openstack_networking_router_interface_v2" "snat_interface_backend" {
  router_id = "${openstack_networking_router_v2.snat.id}"
  subnet_id = "${module.backend.subnet_id}"
}
