module "cluster_v3" {
  source        = "../../base/cluster/v3/"
  instance_name = "${var.instance_name}"
  image_name    = "${var.image_name}"
  flavor_name   = "${var.flavor_name}"
  key_pair      = "${var.key_pair}"
  ansible_group = "${var.ansible_group}"
  network_name  = "${var.network_name}"
  cidr          = "${var.cidr}"
  router_name   = "${var.router_name}"
  nb_instances  = "${var.nb_instances}"
}
