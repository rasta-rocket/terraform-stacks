resource "openstack_compute_secgroup_v2" "secgroup" {
  name        = "${var.secgroup_name}"
  description = "${var.secgroup_description}"

  rule {
    from_port   = "80"
    to_port     = "80"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = "443"
    to_port     = "443"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
