mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh 
sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
systemctl restart network
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0