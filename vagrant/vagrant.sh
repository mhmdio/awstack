cd /vagrant/packer-templates/ubuntu-14.04.5
packer build template.json
vagrant init ubuntu-14-04-5-server-amd64-virtualbox.box
vagrant up
vagrant ssh
