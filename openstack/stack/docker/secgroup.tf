resource "openstack_compute_secgroup_v2" "docker_secgroup" {
  name        = "docker_secgroup"
  description = "Allow Docker host traffic"

  rule {
    from_port   = "${var.docker_api_port}"
    to_port     = "${var.docker_api_port}"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
