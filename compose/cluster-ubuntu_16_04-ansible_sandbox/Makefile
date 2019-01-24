ANSIBLE_SANDBOX_SCALE=3
ANSIBLE_SANDBOX_INVENTORY=/tmp/ansible_sandbox_hosts

provision:
	docker-compose up -d --scale node=$(ANSIBLE_SANDBOX_SCALE); \
	echo "[$$(grep "hosts" playbook.yml | awk '{print $$3}')]" > $(ANSIBLE_SANDBOX_INVENTORY); \
	for id in $$(docker ps -f "Name=cluster-ubuntu_16_04-ansible_sandbox" -q); do printf "$$id ansible_host=$$(docker inspect $$id | jq -r '.[].NetworkSettings.Networks["cluster-ubuntu_16_04-ansible_sandbox_ansible_sandbox_net"].IPAddress') ansible_user=root ansible_ssh_pass="" \n"; done >> $(ANSIBLE_SANDBOX_INVENTORY)

teardown:
	rm $(ANSIBLE_SANDBOX_INVENTORY); \
	docker-compose down;

check:
	. ../../ansible/ansible.rc; \
	ansible -i $(ANSIBLE_SANDBOX_INVENTORY) \
	-m ping \
	all

configure:
	. ../../ansible/ansible.rc; \
	ansible-playbook -i $(ANSIBLE_SANDBOX_INVENTORY) \
	playbook.yml

connect:
	for i in $$(docker inspect $$(docker ps -f "Name=cluster-ubuntu_16_04-ansible_sandbox" -q) | jq -r '.[].NetworkSettings.Networks["cluster-ubuntu_16_04-ansible_sandbox_ansible_sandbox_net"].IPAddress' | xargs); do \
	  echo "SSH : connecting to ... $$i "; \
	  $$($$COLORTERM -e "ssh root@$$i"); \
	done

disconnect:
	for i in $$(docker inspect $$(docker ps -f "Name=cluster-ubuntu_16_04-ansible_sandbox" -q) | jq -r '.[].NetworkSettings.Networks["cluster-ubuntu_16_04-ansible_sandbox_ansible_sandbox_net"].IPAddress' | xargs); do \
	  echo "SSH : disconnecting from ... $$i "; \
	  pkill -f "ssh root@$$i"; \
	done

test: provision configure teardown
