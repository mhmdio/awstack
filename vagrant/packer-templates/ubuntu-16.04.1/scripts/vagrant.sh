date > /etc/vagrant_box_build_time

mkdir /home/vagrant/.ssh
wget --no-check-certificate \
    'https://github.com/mhmdio/wiki/blob/master/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
