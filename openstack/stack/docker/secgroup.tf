resource "openstack_compute_secgroup_v2" "docker_secgroup" {
  name        = "${var.security_group_docker_name}"
  description = "Allow Docker host traffic"

  rule {
    from_port   = "${var.docker_api_port}"
    to_port     = "${var.docker_api_port}"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
