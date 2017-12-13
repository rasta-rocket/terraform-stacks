# Cloud Stacks
Set of cloud based stacks managed with [terraform](https://www.terraform.io/).

## Dependencies
To setup these stacks, install the following:
* [Terraform](https://www.terraform.io/)(>=10)
* [Ansible](https://www.ansible.com/) (>=2.4)
* [Terraform-Inventory](https://github.com/rasta-rocket/terraform-inventory)

## Usage
Go to the stack directory and chose one use case:

```sh
$ cd stacks
$ ls
backend
bastion
host_route
lbaas
multiple_fip
nginx
router
security_group_http
security_group_ssh_icmp
...

```

For each stack the workflow is basically the same:

```sh
$ cd nginx/v1
$ vim terraform.tfvars
$ terraform init
$ terraform apply
$ terraform-inventory -u user -k ~/.ssh/private_ssh_key
$ ansible-playbook playbook.yml
```

For some stack with specific steps to perform, refer to the related documentation.

## Support
Currently support only Openstack API provider.
