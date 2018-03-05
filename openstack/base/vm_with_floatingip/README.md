# Instance with floating IP

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
| Name                 | Default         | Description                                  |
|----------------------|-----------------|----------------------------------------------|
| instance_name        |                 | Name of the instance                         |
| image_name           |                 | Image of the instance                        |
| flavor_name          |                 | Flavor of the instance                       |
| key_pair             |                 | Key pair name used for SSH                   |
| security_groups_list | ["default"]     | List of the security groups                  |
| ansible_group        | default_group   | Ansible Hostgroups name                      |
| pool                 | public          | Name of the pool to rertieve the floating IP |
| network_name         | net_tf          | Name of the network                          |
| cidr                 | 192.168.1O.0/24 | CIDR                                         |
| count                | 1               | Number of bastion to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| fip_address   | List of floating IP address                  |
| ip_address    | List of internal IP address                  |
| subnet_id     | ID of the internal subnet                    |
| instance_id   | List of instance ID                          |

## Prerequisites
None.
