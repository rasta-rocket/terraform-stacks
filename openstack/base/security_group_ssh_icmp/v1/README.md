# Security Group SSH and ICMP

## Topology
```
                                           security_group
                                        _____________________ 
                                       |___|___|___|___|___|_|
                        -------------->|_|___|___|___|___|___|----------->
                        -------------->|___|___|___|___|___|_|
                        -------------->|___|___|___|___|___|_|----------->
                                       |_|___|___|___|___|___|
                                       |___|___|___|___|___|_|
                                       |___|___|___|___|___|_|<-----------
                                       |_|___|___|___|___|___|<-----------
                        <--------------|___|___|___|___|___|_|<-----------

                         +-------------+-----------+---------+-----------+
                         | ip_protocol | from_port | to_port |   cidr    |
                         +-------------+-----------+---------+-----------+
                         | icmp        |        -1 |      -1 | 0.0.0.0/0 |
                         | tcp         |        22 |      22 | 0.0.0.0/0 |
                         +-------------+-----------+---------+-----------+
```

## Usage
```
$ vim terraform.tfvars # Edit mandatory input variables
$ source openstack.rc
$ terraform init
$ terraform apply
```
## Input parameters
| Name                  | Default                    | Description                         |
|-----------------------|----------------------------|-------------------------------------|
| secgroup_name         | secgroup_icmp_ssh          | Name of the security group          |
| secgroup_description  | Allow ICMP and SSH traffic | Description of the security group   |

## Output values
| Name                | Description                                  |
|---------------------|----------------------------------------------|
| secgroup_id         | ID of the security group                     |

## Prerequisites
None.
