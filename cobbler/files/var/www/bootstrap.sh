mkdir --mode=700 /root/.ssh
wget --output-document=/root/.ssh/authorized_keys http://172.17.11.80/mgmt.pub
chmod 600 /root/.ssh/authorized_keys
