output "fip_address" {
  value = ["${openstack_compute_floatingip_associate_v2.assoc_fip.*.floating_ip}"]
}

output "ip_address" {
  value = "${module.vm_on_one_network.ip_address}"
}

output "subnet_id" {
  value = "${module.vm_on_one_network.subnet_id}"
}

output "instance_id" {
  value = "${module.vm_on_one_network.instance_id}"
}
