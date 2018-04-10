resource "openstack_lb_monitor_v1" "monitor" {
  type        = "PING"
  delay       = 30
  timeout     = 5
  max_retries = 3
}

resource "openstack_lb_pool_v1" "pool" {
  name        = "${var.lb_pool_name}"
  protocol    = "${var.lb_protocol}"
  subnet_id   = "${var.members_subnet}"
  lb_method   = "${var.lb_method}"
  lb_provider = "${var.lb_provider}"
  monitor_ids = ["${openstack_lb_monitor_v1.monitor.id}"]
}

resource "openstack_lb_member_v1" "member" {
  admin_state_up = "true"
  pool_id        = "${openstack_lb_pool_v1.pool.id}"
  address        = "${element(var.members_ip, count.index)}"
  port           = "${var.lb_port}"
  count          = "${var.nb_members}"
}

resource "openstack_networking_network_v2" "vip_net" {
  name = "${var.vip_network_name}"
}

resource "openstack_networking_subnet_v2" "vip_subnet" {
  network_id = "${openstack_networking_network_v2.vip_net.id}"
  cidr       = "${var.vip_net_cidr}"
}

resource "openstack_lb_vip_v1" "vip" {
  admin_state_up = "true"
  name           = "${var.lb_vip_name}"
  subnet_id      = "${openstack_networking_subnet_v2.vip_subnet.id}"
  protocol       = "${var.lb_protocol}"
  port           = "${var.lb_port}"
  pool_id        = "${openstack_lb_pool_v1.pool.id}"
}
