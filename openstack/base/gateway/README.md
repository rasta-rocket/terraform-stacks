# Gateway

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
                                                        |
                                                        |
                                                     gateway
                                                    __________ 
                                                  /[_...__...°]\
                                                 /      |       \
                                                /       |        \
                                               /        |         \
                                              /         |          \
                                             /          |           \
                                            /           |            \
                           .-,(  ),-.      /       .-,(  ),-.         \       .-,(  ),-.    
                        .-(          )-.  /     .-(          )-.       \   .-(          )-. 
                       (      net_0     )/     (      net_1     )       \ (      net_2     )
                        '-(          ).-'       '-(          ).-'          '-(          ).-'
                            '-.( ).-'               '-.( ).-'                  '-.( ).-'    
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
| router_name           | router        | Name of the gateway                                    |
| subnet_ids            |               | List of the subnet IDs the gateway should be connected |
| nb_subnet             |               | Number of subnet that will be connected to the gateway |
| ext_gw_net            |               | Name of the external network                           |

## Output values
| Name                | Description                                  |
|---------------------|----------------------------------------------|
| router_id           | ID of the gateway                            |

## Prerequisites
None.
