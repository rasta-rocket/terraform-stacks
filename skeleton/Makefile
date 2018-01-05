TF_STATE = "*tfstate*"
TF_MODULES = ".terraform"

ANSIBLE_CFG = "ansible.cfg"
ANSIBLE_REQUIREMENTS = "requirements.yml"
ANSIBLE_INVENTORY = "hosts"
ANSIBLE_PLAYBOOK = "playbook.yml"
ANSIBLE_OPTS = ""

# Uncomment and set the following variable
#SSH_USER = "ssh-user"
#SSH_KEY = "~/.ssh/ssh-key"
TF_INVENTORY_OPTS = -u ${SSH_USER} -k ${SSH_KEY}

DOC = "README.md"

TARGET = init deploy destroy clean reset doc tf-init ansible-roles plan provision configure inventory

init: | tf-init ansible-roles
deploy: | provision inventory configure
destroy:
	terraform destroy
clean:
	rm -f ${TF_STATE} ${ANSIBLE_INVENTORY}
reset:
	rm -rf ${TF_MODULES}
doc:
	less ${DOC}
tf-init:
	terraform init
ansible-roles:
	ansible-galaxy install -r ${ANSIBLE_REQUIREMENTS}
plan:
	terraform plan
provision:
	terraform apply
inventory:
	terraform-inventory ${TF_INVENTORY_OPTS}
configure:
	ansible-playbook ${ANSIBLE_PLAYBOOK} 
.SILENT: ${TARGET}

