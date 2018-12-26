# Ansible sandbox (Ubuntu 16.04)
The goal here is to be able to test in a more easy-way our roles and playbooks.  
So here an SSH environment is available in the form of a Docker container in order to run your Ansible stuff.  
Thanks to Docker container, you could test easily on your machine and repeat Ansible runs as many time as you want and also provision very quickly new SSH environment.  
Note that your Ansible roles should be adapted for an _Ubuntu 16.04_.

__New Features__ : Note also that _Systemd_ is enabled in this sandbox environment.

## Requirements
* Ansible
* Docker
* make

## Quickstart
```
# Do it once ! (it will build the docker image)
$ make init

# Define your role in cloud-stacks/ansible
# Add your playbook in the current directory (host groups should be all)
 
# Finally
$ make test
```

## Fine-grained action
You could also perform more granular action, which means split the steps (provision, configure, teardown) in order to troubleshoot deeper your work.
```
# Check that you are able to reach the container
$ make check

# Provision the SSH-enabled container
$ make provision

# Run the ansible-playbook against the container
# Do it as many time as you want, until your role is working as expected
$ make configure

# Optionally you could connect to the container to check if all is ok
$ make connect

# Destroy the container
$ make teardown
```
