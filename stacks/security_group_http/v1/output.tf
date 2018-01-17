output "secgroup_id" {
  value = "${openstack_compute_secgroup_v2.secgroup.id}"
}
