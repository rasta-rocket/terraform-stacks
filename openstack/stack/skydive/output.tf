output "analyzer_ips" {
  value = "${module.analyzer.ip_address}"
}

output "agent_ips" {
  value = "${module.agent.ip_address}"
}

output "bastion_ip" {
  value = "${module.bastion.ip_address}"
}

output "bastion_fip" {
  value = "${module.bastion.fip_address}"
}
