# Backend v2

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
                                   ----------------------------------------------------
                                   |                                                  |
                                   |                                               89.39.49.3
                                                                                   bastion
                                gateway                .-,(  ),-.                   ____ 
                              __________            .-(          )-.               |====|
                             [_...__...°]----------(   bastion_net  )--------------|    |
                                   |                '-(          ).-'              |    |
                                   |                    '-.( ).-'                  |____|
                                   |
                              .-,(  ),-.                                           192.168.1.3
                           .-(          )-.  
                          (   backend_net   )
                           '-(          ).-' 
                               '-.( ).-'     
                                   |
                                   |
                                   |
                  ----------------------------------------
                  |                |                     |
             192.168.10.3     192.168.10.4          192.168.10.xxx
             backend_0        backend_1             backend_n
              ________         ________              ________ 
             |==|=====|       |==|=====|            |==|=====|
             |  |     |       |  |     |            |  |     |
             |  |     |       |  |     |            |  |     |
             |  |     |       |  |     |   . . .    |  |     |
             |  |     |       |  |     |            |  |     |
             |  |====°|       |  |====°|            |  |====°|
             |__|_____|       |__|_____|            |__|_____|
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
| backend_name          | backend_server  | Name of the backend instance                 |
| backend_ansible_group | backend         | Ansible hostgroups name for backend          |
| backend_net           | backend_net     | Name of the backend network                  |
| backend_cidr          | 192.168.20.0/24 | CIDR for the backend network                 |
| bastion_name          | bastion_server  | Name of the bastion instance                 |
| bastion_ansible_group | bastion         | Ansible hostgroups name for bastion          |
| bastion_net           | bastion_net     | Name of the bastion network                  |
| bastion_cidr          | 192.168.2.0/24  | CIDR for the bastion network                 |
| pool                  | public          | Name of the pool to rertieve the floating IP |
| gateway_name          | gateway         | Name of the gateway                          |
| nb_backend            | 1               | Number of backend to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| backend_ip    | Internal IP address of backend               |
| bastion_ip    | Internal IP address of bastion               |
| bastion_fip   | Floating IP address of bastion               |

## Prerequisites
None.
