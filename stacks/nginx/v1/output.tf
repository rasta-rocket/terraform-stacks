output "fip_address" {
  value = "${module.backend.fip_address}"
}

output "ip_address" {
  value = "${module.backend.ip_address}"
}

output "subnet_id" {
  value = "${module.backend.subnet_id}"
}

output "instance_id" {
  value = "${module.backend.instance_id}"
}
