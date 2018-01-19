TF_STATE = "*tfstate*"
TF_MODULES = ".terraform"

DOC = "README.md"

TARGET = init deploy destroy clean reset doc tf-init ansible-roles plan provision configure inventory

init: | tf-init 
deploy: | provision 
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
plan:
	terraform plan
provision:
	terraform apply
.SILENT: ${TARGET}

