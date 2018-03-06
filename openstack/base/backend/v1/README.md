# Backend v1

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
                     ---------------------------------------------------------------------
                     |                |                     |                            |
                89.39.49.4       89.39.49.5            89.39.49.xxx                      |
                backend_0        backend_1             backend_n                         |
                 ________         ________              ________                       89.39.49.3
                |==|=====|       |==|=====|            |==|=====|                      bastion
                |  |     |       |  |     |            |  |     |                       ____ 
                |  |     |       |  |     |            |  |     |                      |====|
                |  |     |       |  |     |   . . .    |  |     |                      |    |
                |  |     |       |  |     |            |  |     |                      |    |
                |  |====°|       |  |====°|            |  |====°|                      |____|
                |__|_____|       |__|_____|            |__|_____|
                                                                                      192.168.1.3
                192.168.10.3     192.168.10.4         192.168.10.xxx                     |
                     |                |                     |                            |
                     ----------------------------------------                            |
                                      |                                                  |
                                      |                                                  |
                                 .-,(  ),-.                   router                 .-,(  ),-.    
                              .-(          )-.              __________            .-(          )-. 
                             (   backend_net  )------------[_...__...°]----------(   bastion_net  )
                              '-(          ).-'                                   '-(          ).-'
                                  '-.( ).-'                                           '-.( ).-'    
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
| backend_name            | backend         | Name of the backend instance                 |
| backend_security_groups | ["default"]     | List of the backend security groups          |
| backend_ansible_group   | backend_group   | Ansible hostgroups name for backend          |
| backend_net             | backend_net     | Name of the backend network                  |
| backend_cidr            | 192.168.10.0/24 | CIDR for the backend network                 |
| bastion_name            | bastion         | Name of the bastion instance                 |
| bastion_security_groups | ["default"]     | List of the bastion security groups          |
| bastion_ansible_group   | bastion_group   | Ansible hostgroups name for bastion          |
| bastion_net             | bastion_net     | Name of the bastion network                  |
| bastion_cidr            | 192.168.1.0/24  | CIDR for the bastion network                 |
| pool                    | public          | Name of the pool to rertieve the floating IP |
| router_name             | router          | Name of the router                           |
| count                   | 1               | Number of backend to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| backend_ip    | Internal IP address of backend               |
| bastion_ip    | Internal IP address of bastion               |
| backend_fip   | Floating IP address of backend               |
| bastion_fip   | Floating IP address of bastion               |

## Prerequisites
None.
