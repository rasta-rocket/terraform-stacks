# Topology
```
   ________                                     .--.               
  |==|=====|                                _ -(    )- _           
  |  |     |                           .--,(            ),--.      
  |  |     |                       _.-(                       )-._ 
  |  |     |--------------------->(            NETWORK #1         )
  |  |     |                       '-._(                     )_.-' 
  |  |====�|                            '__,(            ),__'     
  |__|_____|                                 - ._(__)_. -          

     VM #1
                        _____________
                        \            \
                         )  1 to n    )
                        /____________/



   ________                                     .--.               
  |==|=====|                                _ -(    )- _           
  |  |     |                           .--,(            ),--.      
  |  |     |                       _.-(                       )-._ 
  |  |     |--------------------->(            NETWORK #n         )
  |  |     |                       '-._(                     )_.-' 
  |  |====�|                            '__,(            ),__'     
  |__|_____|                                 - ._(__)_. -          

     VM #n

```

# Usage
```
$ vim terraform.tfvars
$ source openstack.rc
$ terraform get
$ terraform apply -var 'count=3'
```
# Input parameters
| Name          | Default         | Description                  |
|---------------|-----------------|------------------------------|
| instance_name |                 | Name of the instance         |
| image_name    |                 | Image of the instance        |
| flavor_name   |                 | Flavor of the instance       |
| network_name  | net_tf          | Name of the network          |
| cidr          | 192.168.10.0/24 | CIDR                         |
| count         | 1               | Number of topology to create |

# Prerequisites
None.
