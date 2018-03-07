# Backend v4

## Topology
```
```

## Usage
```
$ vim terraform.tfvars # Edit mandatory input variables
$ source openstack.rc
$ terraform init
$ terraform apply
```
## Input parameters
| Name                    | Default         | Description                                  |
|-------------------------|-----------------|----------------------------------------------|
| image_name              |                 | Image of the instance                        |
| flavor_name             |                 | Flavor of the instance                       |
| key_pair                |                 | Key pair name used for SSH                   |
| backend_name            | backend_server  | Name of the backend instance                 |
| backend_security_groups | ["default"]     | List of the backend security groups          |
| backend_ansible_group   | backend         | Ansible hostgroups name for backend          |
| backend_net             | backend_net     | Name of the backend network                  |
| backend_cidr            | 192.168.10.0/24 | CIDR of the backend network                  |
| nb_backend              | 2               | Number of backend to create                  |
| bastion_name            | bastion_server  | Name of the bastion instance                 |
| bastion_security_groups | ["default"]     | List of the bastion security groups          |
| bastion_ansible_group   | bastion         | Ansible hostgroups name for bastion          |
| bastion_net             | bastion_net     | Name of the bastion network                  |
| bastion_cidr            | 192.168.1.0/24  | CIDR of the bastion network                  |
| external_net            | public          | Name of the pool to rertieve the floating IP |
| gateway_name            | gateway         | Name of the router                           |
| vip_net                 | lb_vip_net      | Name of the VIP network                      |
| vip_cidr                | 192.168.20.0/24 | CIDR of the VIP network                      |
| lb_port                 | 80              | LBaaS port number                            |
| lb_protocol             | HTTP            | LBaaS protocol                               |
| lb_method               | ROUND_ROBIN     | LBaaS method                                 |
| lb_provider             | haproxy         | LBaaS provider (implementation)              |
| lb_pool_name            | lb_pool         | LBaaS pool name                              |
| lb_vip_name             | lb_vip          | LBaaS VIP name                               |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| backend_ip    | Internal IP address of backend               |
| vip_address   | VIP address of the LBaaS                     |
| vip_fip       | Floating IP address of the LBaaS VIP         |
| bastion_ip    | Internal IP address of bastion               |
| bastion_fip   | Floating IP address of bastion               |

## Prerequisites
None.
