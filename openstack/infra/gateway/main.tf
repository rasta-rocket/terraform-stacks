module "gateway" {
  source       = "../../base/gateway"
  router_name  = "${var.router_name}"
  subnet_ids   = []
  nb_subnet    = "0"
  external_net = "${var.external_net}"
}
