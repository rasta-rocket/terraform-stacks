output "nginx_internal_ip" {
	value = "${module.backend_v1.backend_ip}"
}
output "nginx_public_ip" {
	value = "${module.backend_v1.backend_fip}"
}
output "bastion_internal_ip" {
        value = "${module.backend_v1.bastion_ip}"
}
output "bastion_public_ip" {
        value = "${module.backend_v1.bastion_fip}"
}
