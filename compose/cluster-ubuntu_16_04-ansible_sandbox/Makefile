ANSIBLE_SANDBOX_SCALE=3

provision:
	docker-compose up -d --scale node=$(ANSIBLE_SANDBOX_SCALE)

teardown:
	docker-compose down

check:
	. ../../ansible/ansible.rc; \
	ansible -i "$$(docker inspect $$(docker ps -f "Name=cluster-ubuntu_16_04-ansible_sandbox" -q) | jq -r '.[].NetworkSettings.Networks["cluster-ubuntu_16_04-ansible_sandbox_ansible_sandbox_net"].IPAddress' | xargs -I{} echo "{}," | xargs)" \
	-e ansible_user=root \
	-e ansible_ssh_pass="" \
	-m ping \
	all

configure:
	. ../../ansible/ansible.rc; \
	ansible-playbook -i "$$(docker inspect $$(docker ps -f "Name=cluster-ubuntu_16_04-ansible_sandbox" -q) | jq -r '.[].NetworkSettings.Networks["cluster-ubuntu_16_04-ansible_sandbox_ansible_sandbox_net"].IPAddress' | xargs -I{} echo "{}," | xargs)" \
	-e ansible_user=root \
	-e ansible_ssh_pass="" \
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
