output "backend_ip_project_A" {
  value = "${module.deployment_project_A.backend_ip}"
}

output "bastion_ip_project_A" {
  value = "${module.deployment_project_A.bastion_ip}"
}

output "bastion_fip_project_A" {
  value = "${module.deployment_project_A.bastion_fip}"
}

output "backend_ip_project_B" {
  value = "${module.deployment_project_B.backend_ip}"
}

output "bastion_ip_project_B" {
  value = "${module.deployment_project_B.bastion_ip}"
}

output "bastion_fip_project_B" {
  value = "${module.deployment_project_B.bastion_fip}"
}

output "project_A" {
  value = "${var.name_project_A}"
}

output "virtual_network_project_A" {
  value = "${var.backend_net}"
}

output "project_B" {
  value = "${var.name_project_B}"
}

output "virtual_network_project_B" {
  value = "${var.backend_net}"
}
