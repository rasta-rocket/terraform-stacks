output "backend_ip" {
  value = "${module.backend_v3.backend_ip}"
}

output "vip_address" {
  value = "${module.backend_v3.vip_address}"
}

output "bastion_ip" {
  value = "${module.backend_v3.bastion_ip}"
}

output "bastion_fip" {
  value = "${module.backend_v3.bastion_fip}"
}
