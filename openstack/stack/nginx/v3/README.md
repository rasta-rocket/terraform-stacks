# Nginx v3

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
                                ----------------------------------------------------------------
                                |                                                              |
                                |                                                              |
                             gateway                                                           |
                           __________                                                       89.39.49.3
                          [_...__...°]                                                      bastion
                                |                               .-,(  ),-.                   ____ 
                                |                            .-(          )-.               |====|
                   -----------------------------------------(   bastion_net  )--------------|    |
                   |                           |             '-(          ).-'              |    |
                   |                           |                 '-.( ).-'                  |____|
                   |                           |
                   |                           |                                            192.168.1.3
              .-,(  ),-.                  .-,(  ),-.     
           .-(          )-.            .-(          )-.  
          (   backend_net  )          (   lb_vip_net   ) 
           '-(          ).-'           '-(          ).-' 
               '-.( ).-'                   '-.( ).-'     
                   |                           |
                   |                           |
                   |                     192.168.20.3
                   |                     load_balancer
                   |                      __________ 
                   |                     |____oooo_°|
                   |                           |
                   |                           |
                   |                           |
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
$ terraform-inventory -u <SSH_USER> -k <SSH_KEY>
$ ansible-galaxy install -r requirements.yml
$ ansible-playbook playbook.yml
```
## Input parameters
| Name                         | Default                       | Description                                  |
|------------------------------|-------------------------------|----------------------------------------------|
| image_name                   |                               | Image of the instance                        |
| flavor_name                  |                               | Flavor of the instance                       |
| key_pair                     |                               | Key pair name used for SSH                   |
| backend_name                 | nginx_server                  | Name of the backend instance                 |
| backend_ansible_group        | nginx                         | Ansible hostgroups name for backend          |
| backend_net                  | nginx_net                     | Name of the backend network                  |
| backend_cidr                 | 192.168.10.0/24               | CIDR of the backend network                  |
| nb_backend                   | 2                             | Number of backend to create                  |
| bastion_name                 | bastion_server                | Name of the bastion instance                 |
| bastion_ansible_group        | bastion                       | Ansible hostgroups name for bastion          |
| bastion_net                  | bastion_net                   | Name of the bastion network                  |
| bastion_cidr                 | 192.168.1.0/24                | CIDR of the bastion network                  |
| external_net                 | public                        | Name of the pool to rertieve the floating IP |
| gateway_name                 | gateway                       | Name of the router                           |
| vip_net                      | nginx_vip_net                 | Name of the VIP network                      |
| vip_cidr                     | 192.168.20.0/24               | CIDR of the VIP network                      |
| lb_port                      | 80                            | LBaaS port number                            |
| lb_protocol                  | HTTP                          | LBaaS protocol                               |
| lb_method                    | ROUND_ROBIN                   | LBaaS method                                 |
| lb_provider                  | haproxy                       | LBaaS provider (implementation)              |
| lb_pool_name                 | nginx_pool                    | LBaaS pool name                              |
| lb_vip_name                  | nginx_vip                     | LBaaS VIP name                               |
| security_group_ssh_icmp_name | nginx_security_group_ssh_icmp | Name of the security group SSH + ICMP        |
| security_group_http_name     | nginx_security_group_http     | Name of the security group HTTP(s)           |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| backend_ip    | Internal IP address of backend               |
| vip_address   | VIP address of the LBaaS                     |
| bastion_ip    | Internal IP address of bastion               |
| bastion_fip   | Floating IP address of bastion               |

## Prerequisites
* Use a Debian-based distro (e.g. Ubuntu) for the image.
