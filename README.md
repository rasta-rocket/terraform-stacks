[![GitHub issues](https://img.shields.io/github/issues/rasta-rocket/cloud-stacks.svg)](https://github.com/rasta-rocket/cloud-stacks/issues)
[![GitHub forks](https://img.shields.io/github/forks/rasta-rocket/cloud-stacks.svg)](https://github.com/rasta-rocket/cloud-stacks/network)
[![GitHub stars](https://img.shields.io/github/stars/rasta-rocket/cloud-stacks.svg)](https://github.com/rasta-rocket/cloud-stacks/stargazers)
[![GitHub license](https://img.shields.io/github/license/rasta-rocket/cloud-stacks.svg)](https://github.com/rasta-rocket/cloud-stacks/blob/master/LICENSE)

# Cloud Stacks
Set of cloud based stacks managed with [terraform](https://www.terraform.io/).

## Dependencies
To setup these stacks, install the following:
* [Terraform](https://www.terraform.io/) (>=10)
* [Ansible](https://www.ansible.com/) (>=2.4)
* [Terraform-Inventory](https://github.com/rasta-rocket/terraform-inventory)

## Usage
Go to the stack directory and chose one use case:

```
$ tree -L 2 openstack/
openstack/
├── base
│   ├── backend
│   ├── bastion
│   ├── gateway
│   ├── lbaas
│   ├── lbaas_with_fip
│   ├── multiple_fip
│   ├── router
│   ├── security_group_http
│   ├── security_group_ssh_icmp
│   ├── vm_on_one_network
│   ├── vm_with_floatingip
│   └── vm_with_single_network
└── stack
    ├── mysql
    └── nginx

```

For each stack the workflow is basically the same:

```
$ cd openstack/stack/nginx/v1
$ vim terraform.tfvars
$ terraform init
$ terraform apply
$ terraform-inventory -u <SSH_USER> -k <SSH_KEY>
$ ansible-galaxy install -r requirements.yml
$ ansible-playbook playbook.yml
```

For some stack with specific steps to perform, refer to the related documentation.

## Support
Currently support only Openstack API provider.
