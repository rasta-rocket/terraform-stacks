# Router

## Topology
```
                                                 .-,(  ),-.    
                                              .-(          )-. 
                                             (      net_3     )
                                              '-(          ).-'
                                                  '-.( ).-'    
                                                      |
                                                      |
                                                      |
                                                      |
                                                      |
                                                      |
                       .-,(  ),-.                   router                   .-,(  ),-.    
                    .-(          )-.              __________              .-(          )-. 
                   (      net_0     )------------[_...__...°]------------(      net_2     )
                    '-(          ).-'                 |                   '-(          ).-'
                        '-.( ).-'                     |                       '-.( ).-'    
                                                      |
                                                      |
                                                      |
                                                      |
                                                 .-,(  ),-.    
                                              .-(          )-. 
                                             (      net_1     )
                                              '-(          ).-'
                                                  '-.( ).-'    
```

## Usage
```
$ vim terraform.tfvars # Edit mandatory input variables
$ source openstack.rc
$ terraform init
$ terraform apply
```
## Input parameters
| Name                  | Default       | Description                                            |
|-----------------------|---------------|--------------------------------------------------------|
| router_name           | router        | Name of the router                                     |
| network_ids           |               | List of the network IDs the router should be connected |
| nb_network            |               | Number of network that will be connected to the router |
| secgroup_ids          |               | List of secgroup_ids applied on the router port(s)     |

## Output values
| Name                | Description                                  |
|---------------------|----------------------------------------------|
| router_id           | ID of the router                             |

## Prerequisites
None.
