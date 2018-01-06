# Nginx v1

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
              89.39.49.4       89.39.49.3            89.39.49.xxx                      |
              nginx_server_0   nginx_server_1        nginx_server_n                    v
               ________         ________              ________                        89.39.49.3
              |==|=====|       |==|=====|            |==|=====|                     bastion_server
              |  |     |       |  |     |            |  |     |                      ____
              |  |     |       |  |     |     . . .  |  |     |                     |====|
              |  |     |       |  |     |            |  |     |                     |    |
              |  |     |       |  |     |            |  |     |                     |    |
              |  |====°|       |  |====°|            |  |====°|                     |____|
              |__|_____|       |__|_____|            |__|_____|
                                                                                    192.168.1.3
              192.168.10.3     192.168.10.4         192.168.10.xxx                     |
                   |                |                     |                            |
                   ----------------------------------------                            |
                                    |                                                  |
                                    |                                                  v
                               .-,(  ),-.            router_nginx_bastion          .-,(  ),-.
                            .-(          )-.              __________            .-(          )-.
                           (    nginx_net   )----------- [_...__...°]----------(   bastion_net  )
                            '-(          ).-'                                   '-(          ).-'
                                '-.( ).-'                                           '-.( ).-'
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
| Name                  | Default              | Description                                  |
|-----------------------|----------------------|----------------------------------------------|
| image_name            |                      | Image of the instance                        |
| flavor_name           |                      | Flavor of the instance                       |
| key_pair              |                      | Key pair name used for SSH                   |
| backend_name          | nginx_server         | Name of the backend instance                 |
| backend_ansible_group | nginx                | Ansible hostgroups name for backend          |
| backend_net           | nginx_net            | Name of the backend network                  |
| backend_cidr          | 192.168.10.0/24      | CIDR for the backend network                 |
| bastion_name          | bastion_server       | Name of the bastion instance                 |
| bastion_ansible_group | bastion              | Ansible hostgroups name for bastion          |
| bastion_net           | bastion_net          | Name of the bastion network                  |
| bastion_cidr          | 192.168.1.0/24       | CIDR for the bastion network                 |
| pool                  | public               | Name of the pool to rertieve the floating IP |
| router_name           | router_nginx_bastion | Name of the router                           |
| count                 | 1                    | Number of backend to create                  |

## Output values
| Name                | Description                                  |
|---------------------|----------------------------------------------|
| nginx_internal_ip   | Internal IP address of backend server        |
| nginx_public_ip     | Public IP address of backend server          |
| bastion_internal_ip | Internal IP address of bastion               |
| bastion_public_ip   | Public IP address of bastion                 |

## Prerequisites
* Use a Debian-based distro (e.g. Ubuntu) for the image.
