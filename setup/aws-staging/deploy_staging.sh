#!/bin/bash

# echo "Please enter some input: "
# read input_variable
# echo "You entered: $input_variable"

clear
echo ""
RD_TITLE="==== AWS Infrastructure Warmup ===="
TITLE_BYTES=${#rd_title}
UNDERLINE_STRING=$(for ((i=1; i<=$TITLE_BYTES; i++));do printf "%s" "=";done;printf "\n")

echo $RD_TITLE
echo $UNDERLINE_STRING
echo "Validate Packer Templates and test Terrafrom Planning ?"

PS3='Select an Option: '
options=("[Y]Test" "[N]Quit")
select opt in "${options[@]}"
do
    if [[ "$REPLY" == "1" || "$REPLY" == "Y" || "$REPLY" == "y" ]]; then
        echo "$(tput setab 1)==> Test Terraform Plan$(tput sgr 0)"
        # terraform plan -var "domain=$1"
        echo "==> Done !"
        echo "$(tput setab 1)==> Apply Terraform artifact$(tput sgr 0)"
        # terraform apply -var "domain=$1"
        echo "==> Done !"
        echo "$(tput setab 1)==> Start Ansible syntax-check$(tput sgr 0)"
        # ansible-playbook --syntax-check site.yml -i production
        echo "==> Done !"
        echo "$(tput setab 1)==> Start Ansible-lint to checks playbooks for practices and behaviour that could potentially be improved$(tput sgr 0)"
        # ansible-lint site.yml
        echo "==> Done !"
        echo "$(tput setab 1)==> Run ansible-playbook using vault_pass $(tput sgr 0)"
        # ansible-playbook site.yml -i production --extra-vars "domain_name=$1" -v --vault-password-file .vault_pass
        echo "==> Done !"
        break
    elif [[ "$REPLY" == "2" || "$REPLY" == "N" || "$REPLY" == "n" ]]; then
        echo "Quitting MayteIO WordPress Deployer"
        break
    else
        echo "Invalid Selection...Press any key to try again!"
    fi
done
