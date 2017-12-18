resource "openstack_compute_secgroup_v2" "secgroup" {
  name = "${var.secgroup_name}"
  description = "${var.secgroup_description}"

  rule {
    from_port = "22"
    to_port = "22"
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }

  rule {
    from_port = "-1"
    to_port = "-1"
    ip_protocol = "icmp"
    cidr = "0.0.0.0/0"
  }
}
