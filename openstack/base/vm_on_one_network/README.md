# VM on one network

## Topology
```
                                                 .-,(  ),-.    
                                              .-(    net   )-. 
                                             ( 192.168.10.0/24)
                                              '-(          ).-'
                                                  '-.( ).-'    
                                                      |
                                                      |
                                                      |
                                                      |
                                                      |
                                  -----------------------------------------
                                  |               |                       |
                                  |               |                       |
                             192.168.10.3    192.168.10.3             192.168.10.xxx
                              ________        ________                 ________ 
                             |==|=====|      |==|=====|               |==|=====|
                             |  |     |      |  |     |               |  |     |
                             |  |     |      |  |     |               |  |     |
                             |  |     |      |  |     |     . . .     |  |     |
                             |  |     |      |  |     |               |  |     |
                             |  |====°|      |  |====°|               |  |====°|
                             |__|_____|      |__|_____|               |__|_____|
                         
                             server_0        server_1                 server_n
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
| ansible_group        | default         | Ansible Hostgroups name                      |
| network_name         | net             | Name of the network                          |
| cidr                 | 192.168.10.0/24 | CIDR                                         |
| count                | 1               | Number of bastion to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| ip_address    | List of internal IP address                  |
| instance_id   | List of instance ID                          |
| subnet_id     | ID of the internal subnet                    |

## Prerequisites
None.
