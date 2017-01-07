#!/bin/bash

clear
echo ""
RD_TITLE="==== AWS Infrastructure Warmup ===="
TITLE_BYTES=${#rd_title}
UNDERLINE_STRING=$(for ((i=1; i<=$TITLE_BYTES; i++));do printf "%s" "=";done;printf "\n")

SETUPDIR=/Users/mohammed/GitHub/aws-terraform/setup/
TEMPLATESDIR=/Users/mohammed/GitHub/aws-terraform/aws/packer/templates/
STAGINGDIR=/Users/mohammed/GitHub/aws-terraform/aws/terraform/us_east_1_staging/

echo $RD_TITLE
echo $UNDERLINE_STRING
echo "Validate Packer Templates and Test Terrafrom Plans ?"

PS3='Select an Option: '
options=("[Y]Test" "[N]Quit")
select opt in "${options[@]}"
do
    if [[ "$REPLY" == "1" || "$REPLY" == "Y" || "$REPLY" == "y" ]]; then
        echo "$(tput setab 1)==> Add AWS credentials to environment $(tput sgr 0)"
        cd $SETUPDIR
        . set_vars.sh
        echo ""
        echo "==> Done !"
        echo ""
        echo "$(tput setab 1)==> Validate Packer Base Template $(tput sgr 0)"
        cd $TEMPLATESDIR
        packer validate base.json
        echo "==> Done !"
        echo ""
        echo "$(tput setab 1)==> Validate Packer Consul Template $(tput sgr 0)"
        cd $TEMPLATESDIR
        packer validate consul.json
        echo "==> Done !"
        echo ""
        echo "$(tput setab 1)==> Validate Packer Vault Template $(tput sgr 0)"
        cd $TEMPLATESDIR
        packer validate vault.json
        echo "==> Done !"
        echo ""
        echo "$(tput setab 1)==> Test us_east_1_staging Terraform Plan $(tput sgr 0)"
        cd $STAGINGDIR
        terraform get
        terraform plan
        echo "==> Done !"
        break
    elif [[ "$REPLY" == "2" || "$REPLY" == "N" || "$REPLY" == "n" ]]; then
        echo "Quitting AWS Infrastructure Warmup"
        break
    else
        echo "Invalid Selection...Press any key to try again!"
    fi
done
