# LBaaS

## Topology
```
     .-,(  ),-.                               __________    LB METHOD          .-,(  ),-.
  .-(          )-.  LB PROTOCOL/PORT  .-----.[_|||||||_°]---------------->  .-(          )-.
 (     VIP net    ) ----------------> | VIP |[_|||||||_°]----------------> (   members net  )
  '-(          ).-'                   '-----'[_|||||||_°]---------------->  '-(          ).-'
      '-.( ).-'                                                                 '-.( ).-'
```

## Usage
```
$ vim terraform.tfvars # Edit mandatory input variables
$ source openstack.rc
$ terraform init
$ terraform apply
```
## Input parameters
| Name             | Default         | Description                                  |
|------------------|-----------------|----------------------------------------------|
| members_ip       |                 | List of the members IP addresses             |
| nb_members       |                 | Total number of members                      |
| members_subnet   |                 | Subnet ID of the members                     |
| vip_network_name | lb_vip_net_tf   | Name of the VIP network                      |
| vip_net_cidr     | 192.168.20.0/24 | CIDR of the VIP network                      |
| lb_port          | 80              | Port managed by the loadbalancer             |
| lb_protocol      | HTTP            | Protocol managed by the loadbalancer         |
| lb_method        | ROUND_ROBIN     | Load balancing method                        |
| lb_provider      | haproxy         | Implementation of the loadbalancer           |
| lb_pool_name     | lb_pool_name    | Name of the pool                             |
| lb_vip_name      | lb_vip_tf       | Name of the vip                              |

## Output values
| Name            | Description                                  |
|-----------------|----------------------------------------------|
| vip_subnet_id   | Subnet ID of the Virtual IP                  |
| vip_address     | IP address of the Virtual IP                 |
| backend_address | List of IP addresses of the members          |

## Prerequisites
None.
