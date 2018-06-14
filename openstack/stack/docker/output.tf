output "docker_ip" {
  value = "${module.docker.ip_address}"
}

output "docker_fip" {
  value = "${module.docker.fip_address}"
}
