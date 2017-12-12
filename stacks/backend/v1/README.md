# Backend v1

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
| backend_cidr          | 192.168.10.0/24 | CIDR for the backend network                 |
| bastion_name          | bastion         | Name of the bastion instance                 |
| bastion_ansible_group | bastion_group   | Ansible hostgroups name for bastion          |
| bastion_net           | bastion_net     | Name of the bastion network                  |
| bastion_cidr          | 192.168.1.0/24  | CIDR for the bastion network                 |
| pool                  | public          | Name of the pool to rertieve the floating IP |
| router_name           | router          | Name of the router                           |
| count                 | 1               | Number of backend to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| backend_ip    | Internal IP address of backend               |
| bastion_ip    | Internal IP address of bastion               |
| backend_fip   | Floating IP address of backend               |
| bastion_fip   | Floating IP address of bastion               |

## Prerequisites
None.
