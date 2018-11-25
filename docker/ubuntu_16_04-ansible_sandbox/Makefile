init:
	docker build -t ubuntu_16_04-ansible_sandbox .

provision:
	docker run -d --rm --name ubuntu_16_04-ansible_sandbox ubuntu_16_04-ansible_sandbox

teardown:
	docker stop ubuntu_16_04-ansible_sandbox

check:
	. ../../ansible/ansible.rc; \
	ansible -i $$(docker inspect ubuntu_16_04-ansible_sandbox | jq -r '.[0].NetworkSettings.IPAddress'), -e ansible_user=root -e ansible_ssh_pass="" -m ping all

configure:
	. ../../ansible/ansible.rc; \
	ansible-playbook -i $$(docker inspect ubuntu_16_04-ansible_sandbox | jq -r '.[0].NetworkSettings.IPAddress'),\
		         -e ansible_user=root\
			 -e ansible_ssh_pass=""\
			 playbook.yml

test: provision configure teardown
