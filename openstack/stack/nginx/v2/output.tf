output "backend_ip" {
  value = "${module.backend_v2.backend_ip}"
}

output "bastion_ip" {
  value = "${module.backend_v2.bastion_ip}"
}

output "bastion_fip" {
  value = "${module.backend_v2.bastion_fip}"
}
