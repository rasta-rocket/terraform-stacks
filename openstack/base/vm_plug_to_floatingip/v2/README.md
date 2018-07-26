# Instance with existing floating IP v2

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
                                          |     
                                     89.39.49.4
                                       vm_fip 
                                      ________  
                                     |==|=====| 
                                     |  |     | 
                                     |  |     | 
                                     |  |     | 
                                     |  |     | 
                                     |  |====°| 
                                     |__|_____| 
                                 
                                     192.168.10.3
                                          |     
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
$ source openstack.rc
$ neutron floatingip-create public # Get your Floating IP
$ vim terraform.tfvars # Edit mandatory input variables
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
| floatingip_address   |                 | Floating IP address to use                   |
| network_name         | net_tf          | Name of the network                          |
| cidr                 | 192.168.10.0/24 | CIDR                                         |
| count                | 1               | Number of bastion to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| fip_address   | Floating IP address                          |
| ip_address    | Internal IP address                          |
| subnet_id     | ID of the internal subnet                    |
| instance_id   | Instance ID                                  |

## Prerequisites
* Your floating IP must be created before set up the stack.
* Only one instance can be provisioned for this stack.
