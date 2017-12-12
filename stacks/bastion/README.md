# Bastion

## Topology
```

                                             bastion_0
                                              ____
                                             |====|
                .--.                .------->|    |---------.
            _ -(    )- _            |        |    |         |
       .--,(            ),--.       |        |____|         |    .-,(  ),-.
   _.-(                       )-._  |                       v .-(          )-.
  (           INTERNET            ) |           .            (   bastion net  )
   '-._(                     )_.-'  |           .           ^ '-(          ).-'
        '__,(            ),__'      |                       |     '-.( ).-'
             - ._(__)_. -           |        bastion_n      |
                                    |         ____          |
                                    |        |====|         |
                                    '------->|    |---------'
                                             |    |
                                             |____|

```

## Usage
```
$ vim terraform.tfvars # Edit mandatory input variables
$ source openstack.rc
$ terraform init
$ terraform apply
```
## Input parameters
| Name          | Default         | Description                                  |
|---------------|-----------------|----------------------------------------------|
| instance_name | bastion         | Name of the instance                         |
| image_name    |                 | Image of the instance                        |
| flavor_name   |                 | Flavor of the instance                       |
| key_pair      |                 | Key pair name used for SSH                   |
| ansible_group | bastion_group   | Ansible Hostgroups name                      |
| pool          | public          | Name of the pool to rertieve the floating IP |
| network_name  | bastion_net     | Name of the network                          |
| cidr          | 192.168.1.0/24  | CIDR                                         |
| count         | 1               | Number of bastion to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| fip_address   | List of floating IP address                  |
| ip_address    | List of internal IP address                  |
| subnet_id     | ID of the internal subnet                    |
| instance_id   | List of instance ID                          |
| count         | Number of bastion spawned                    |

## Prerequisites
None.
