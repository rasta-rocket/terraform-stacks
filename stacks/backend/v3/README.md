# Backend v3

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
| Name                  | Default         | Description                                  |
|-----------------------|-----------------|----------------------------------------------|
| image_name            |                 | Image of the instance                        |
| flavor_name           |                 | Flavor of the instance                       |
| key_pair              |                 | Key pair name used for SSH                   |
| backend_name          | backend         | Name of the backend instance                 |
| backend_ansible_group | backend_group   | Ansible hostgroups name for backend          |
| backend_net           | backend_net     | Name of the backend network                  |
| backend_cidr          | 192.168.10.0/24 | CIDR of the backend network                  |
| count                 | 2               | Number of backend to create                  |
| bastion_name          | bastion         | Name of the bastion instance                 |
| bastion_ansible_group | bastion_group   | Ansible hostgroups name for bastion          |
| bastion_net           | bastion_net     | Name of the bastion network                  |
| bastion_cidr          | 192.168.1.0/24  | CIDR of the bastion network                  |
| pool                  | public          | Name of the pool to rertieve the floating IP |
| router_name           | router          | Name of the router                           |
| snat_name             | snat            | Name of the router SNAT                      |
| vip_net               | lb_vip_net      | Name of the VIP network                      |
| vip_cidr              | 192.168.20.0/24 | CIDR of the VIP network                      |
| lb_port               | 80              | LBaaS port number                            |
| lb_protocol           | HTTP            | LBaaS protocol                               |
| lb_method             | ROUND_ROBIN     | LBaaS method                                 |
| lb_provider           | haproxy         | LBaaS provider (implementation)              |
| lb_pool_name          | lb_pool         | LBaaS pool name                              |
| lb_vip_name           | lb_vip          | LBaaS VIP name                               |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| backend_ip    | Internal IP address of backend               |
| vip_address   | VIP address of the LBaaS                     |
| bastion_ip    | Internal IP address of bastion               |
| bastion_fip   | Floating IP address of bastion               |

## Prerequisites
None.
