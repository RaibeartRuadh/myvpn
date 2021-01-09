mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh
sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo yum install -y epel-release
sudo yum install -y ansible
sudo yum install -y iperf3
name=`hostname`

