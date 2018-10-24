resource "openstack_networking_floatingip_v2" "fip" {
  count = "${var.count}"
  pool  = "public"
}
