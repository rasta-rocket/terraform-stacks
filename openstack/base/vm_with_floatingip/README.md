# Instance with floating IP

## Topology
```
                    .--.
                _ -(    )- _
           .--,(            ),--.
       _.-(                       )-._
      (           INTERNET            )
       '-._(                     )_.-'
            '__,(            ),__'
                 - ._(__)_. -
                      |
                      |
                      |
                      |
     ----------------------------------------
     |                |                     |
89.39.49.4       89.39.49.5            89.39.49.xxx
vm_fip_0         vm_fip_1              vm_fip_n
 ________         ________              ________
|==|=====|       |==|=====|            |==|=====|
|  |     |       |  |     |            |  |     |
|  |     |       |  |     |            |  |     |
|  |     |       |  |     |   . . .    |  |     |
|  |     |       |  |     |            |  |     |
|  |====°|       |  |====°|            |  |====°|
|__|_____|       |__|_____|            |__|_____|

192.168.10.3     192.168.10.4         192.168.10.xxx
     |                |                     |
     ----------------------------------------
                      |
                      |
                 .-,(  ),-.
              .-(          )-.
             (     net_tf     )
              '-(          ).-'
                  '-.( ).-'
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
