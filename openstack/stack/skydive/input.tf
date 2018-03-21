# Default
variable "image_name" {}

variable "flavor_name" {}
variable "key_pair" {}

# Analyzer
variable "analyzer_name" {
  default = "analyzer_server"
}

variable "analyzer_ansible_group" {
  default = "analyzers"
}

variable "nb_analyzer" {
  default = "1"
}

# Agent
variable "agent_name" {
  default = "agent_server"
}

variable "agent_ansible_group" {
  default = "agents"
}

variable "nb_agent" {
  default = "2"
}

# Bastion
variable "bastion_name" {
  default = "bastion_server"
}

variable "bastion_ansible_group" {
  default = "bastion"
}

# Security Group
variable "security_group_ssh_icmp_name" {
  default = "skydive_security_group_ssh_icmp"
}

# Skydive Ports
variable "skydive_analyzer_port" {
	default = "8082"
}

variable "skydive_agent_port" {
	default = "8081"
}

variable "skydive_etcd_port" {
	default = "2379"
}

# Network
variable "external_net" {
  default = "public"
}

variable "analyzer_net" {
  default = "analyzer_net"
}

variable "analyzer_cidr" {
  default = "192.168.60.0/24"
}

variable "agent_net" {
  default = "agent_net"
}

variable "agent_cidr" {
  default = "192.168.70.0/24"
}

variable "bastion_net" {
  default = "bastion_net"
}

variable "bastion_cidr" {
  default = "192.168.80.0/24"
}

# Router
variable "gateway_name" {
  default = "gateway_skydive"
}
