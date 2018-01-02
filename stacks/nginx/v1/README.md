# Nginx

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
     -----------------------------------------------------------
     |                |                                        |
89.39.49.3       89.39.49.4                               89.39.49.xxx
nginx_server_0   nginx_server_1                           nginx_server_n
 ________         ________                                 ________     
|==|=====|       |==|=====|                               |==|=====|    
|  |     |       |  |     |                               |  |     |    
|  |     |       |  |     |           . . .               |  |     |    
|  |     |       |  |     |                               |  |     |    
|  |     |       |  |     |                               |  |     |    
|  |====°|       |  |====°|                               |  |====°|    
|__|_____|       |__|_____|                               |__|_____|    

192.168.0.3      192.168.0.4                             192.168.0.xxx
     |                |                                        |
     -----------------------------------------------------------
                                    |
                                    |
                                .-,(  ),-.    
                             .-(          )-. 
                            (    nginx_net   )
                             '-(          ).-'
                                 '-.( ).-'    
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
| Name          | Default         | Description                                  |
|---------------|-----------------|----------------------------------------------|
| instance_name | nginx_server    | Name of the instance                         |
| image_name    |                 | Image of the instance                        |
| flavor_name   |                 | Flavor of the instance                       |
| key_pair      |                 | Key pair name used for SSH                   |
| ansible_group | nginx           | Ansible Hostgroups name                      |
| pool          | public          | Name of the pool to rertieve the floating IP |
| network_name  | nginx_net       | Name of the internal network                 |
| cidr          | 192.168.10.0/24 | CIDR of the internal network                 |
| count         | 1               | Number of bastion to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| fip_address   | List of floating IP address                  |
| ip_address    | List of internal IP address                  |
| subnet_id     | ID of the internal subnet                    |
| instance_id   | List of instance ID                          |

## Prerequisites
* Use a Debian-based distro (e.g. Ubuntu) for the image.
