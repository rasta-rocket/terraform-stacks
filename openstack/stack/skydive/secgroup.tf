resource "openstack_compute_secgroup_v2" "skydive_secgroup" {
  name        = "skydive_control_plane_secgroup"
  description = "Allow skydive control plane traffic"

  rule {
    from_port   = "${var.skydive_analyzer_port}"
    to_port     = "${var.skydive_analyzer_port}"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = "${var.skydive_agent_port}"
    to_port     = "${var.skydive_agent_port}"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = "${var.skydive_etcd_port}"
    to_port     = "${var.skydive_etcd_port}"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
