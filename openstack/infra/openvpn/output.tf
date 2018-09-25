output "fip_address" {
  value = "${module.vm_plug_to_floatingip.fip_address}"
}

output "ip_address" {
  value = "${module.vm_plug_to_floatingip.ip_address}"
}
