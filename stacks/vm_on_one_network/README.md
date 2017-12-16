# VM on one network

## Topology
```
instance_0    instance_1                instance_n
 ________      ________                  ________
|==|=====|    |==|=====|                |==|=====|
|  |     |    |  |     |                |  |     |
|  |     |    |  |     |                |  |     |
|  |     |    |  |     |     . . .      |  |     |
|  |     |    |  |     |                |  |     |
|  |====°|    |  |====°|                |  |====°|
|__|_____|    |__|_____|                |__|_____|
     |            -------.                   |
     |                   |                   |
     |                   |                   |
     |                   |                   |
     |                   |                   |
     |                   |                   |
     |                   v                   |
     |                 .--.                  |
     |             _ -(    )- _              |
     |        .--,(            ),--.         |
     |    _.-(        net_tf        )-._     |
     '-->(        192.168.10.0/24       ) <--'
          '-._(                     )_.-'
               '__,(            ),__'
                    - ._(__)_. -
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
| instance_name |                 | Name of the instance                         |
| image_name    |                 | Image of the instance                        |
| flavor_name   |                 | Flavor of the instance                       |
| key_pair      |                 | Key pair name used for SSH                   |
| ansible_group | default         | Ansible Hostgroups name                      |
| network_name  | bastion_net     | Name of the network                          |
| cidr          | 192.168.10.0/24 | CIDR                                         |
| count         | 1               | Number of bastion to create                  |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| ip_address    | List of internal IP address                  |
| instance_id   | List of instance ID                          |
| subnet_id     | ID of the internal subnet                    |

## Prerequisites
None.
