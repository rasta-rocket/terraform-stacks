# Ansible cluster sandbox (Ubuntu 16.04)
The goal here is to be able to test in a more easy-way our roles and playbooks against a cluster.  
So here an SSH environment is available in the form of a Docker containers cluster in order to run your Ansible stuff.  
Thanks to Docker compose, you could test easily on your machine and repeat Ansible runs against a SSH-enabled cluster as many time as you want.  
Note that your Ansible roles should be adapted for an _Ubuntu 16.04_.

__New Features__ : Note also that _Systemd_ is enabled in this sandbox environment.

## Requirements
* Ansible
* Docker
* docker-compose
* make

## Quickstart
```
# Be sure you have the based docker image already built ! (do it once)
$ cd ../../docker/ubuntu_16_04-ansible_sandbox/
$ make init
$ cd -

# Define your role in cloud-stacks/ansible
# Add your playbook in the current directory (host groups should be all)
 
# Finally
$ make test
```

## Fine-grained action
You could also perform more granular action, which means split the steps (provision, configure, teardown) in order to troubleshoot deeper your work.
```
# Provision the cluster with SSH-enabled containers
$ make provision

# Check that you are able to reach each container
$ make check

# Run the ansible-playbook against the cluster
# Do it as many time as you want, until your role is working as expected
$ make configure

# Optionally you could connect to the containers to check if all is ok
$ make connect

# And disconnect when you are done
$ make disconnect

# Destroy the cluster
$ make teardown
```
