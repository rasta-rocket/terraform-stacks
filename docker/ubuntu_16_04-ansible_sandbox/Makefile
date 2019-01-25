ANSIBLE_SANDBOX_INVENTORY=/tmp/ansible_sandbox_hosts

init:
	docker build -t ubuntu_16_04-ansible_sandbox .

provision:
	docker run -d --rm --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name ubuntu_16_04-ansible_sandbox ubuntu_16_04-ansible_sandbox; \
	echo "[$$(grep "hosts" playbook.yml | awk '{print $$3}')]" > $(ANSIBLE_SANDBOX_INVENTORY); \
	for id in $$(docker ps -f "Name=ubuntu_16_04-ansible_sandbox" -q); do printf "$$id ansible_host=$$(docker inspect $$id | jq -r '.[0].NetworkSettings.IPAddress') ansible_user=root ansible_ssh_pass="" \n"; done >> $(ANSIBLE_SANDBOX_INVENTORY)

teardown:
	rm $(ANSIBLE_SANDBOX_INVENTORY); \
	docker stop ubuntu_16_04-ansible_sandbox

check:
	. ../../ansible/ansible.rc; \
	ansible -i $(ANSIBLE_SANDBOX_INVENTORY) -m ping all

configure:
	. ../../ansible/ansible.rc; \
	ansible-playbook -i $(ANSIBLE_SANDBOX_INVENTORY) playbook.yml

connect:
	ssh root@$$(docker inspect ubuntu_16_04-ansible_sandbox | jq -r '.[0].NetworkSettings.IPAddress')

test: provision configure teardown
