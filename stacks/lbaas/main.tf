module "vm_on_one_network" {
	source = "../vm_on_one_network"
	instance_name = "${var.instance_name}"
	image_name = "${var.image_name}"
	flavor_name = "${var.flavor_name}"
	key_pair = "${var.key_pair}"
	network_name = "${var.network_name}"
	cidr = "${var.cidr}"
	count = "${var.count}"
}

resource "openstack_networking_network_v2" "net" {
	name = "${var.lb_network_name}"
}

resource "openstack_networking_subnet_v2" "subnet" {
	network_id = "${openstack_networking_network_v2.net.id}"
	cidr = "${var.lb_cidr}"
}

resource "openstack_lb_monitor_v1" "monitor" {
	type = "PING"
	delay = 30
	timeout = 5
	max_retries = 3
}

resource "openstack_lb_pool_v1" "pool" {
	name = "${var.lb_pool_name}"
	protocol = "${var.lb_protocol}"
	subnet_id = "${module.vm_on_one_network.subnet_id}"
	lb_method = "${var.lb_method}"
	lb_provider = "${var.lb_provider}"
	monitor_ids = ["${openstack_lb_monitor_v1.monitor.id}"]
}

resource "openstack_lb_member_v1" "member" {
	pool_id = "${openstack_lb_pool_v1.pool.id}"
	address = "${element(module.vm_on_one_network.ip_address, count.index)}"
	port = "${var.lb_port}"
	count = "${var.count}"
}

resource "openstack_lb_vip_v1" "vip" {
	name = "${var.lb_vip_name}"
	subnet_id = "${openstack_networking_subnet_v2.subnet.id}"
	protocol = "${var.lb_protocol}"
	port = "${var.lb_port}"
	pool_id = "${openstack_lb_pool_v1.pool.id}"
}
