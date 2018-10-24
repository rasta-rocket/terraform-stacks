output "networks" {
  value = ["${openstack_networking_network_v2.net.*.id}"]
}

output "subnets" {
  value = ["${openstack_networking_subnet_v2.subnet.*.id}"]
}

output "cidrs" {
  value = ["${openstack_networking_subnet_v2.subnet.*.cidr}"]
}
