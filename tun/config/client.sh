cat <<EOF > /etc/openvpn/server.conf 
dev tap
remote 192.168.100.10
ifconfig 10.10.10.2 255.255.255.0
topology subnet
route 192.168.100.0 255.255.255.0
secret /etc/openvpn/static.key
comp-lzo
status /var/log/openvpn-status.log
log /var/log/openvpn.log
verb 3
EOF

ssh-keyscan -H 192.168.100.10 >> /root/.ssh/known_hosts

sshpass -p 'vagrant' scp root@192.168.100.10:/etc/openvpn/static.key /etc/openvpn/
systemctl start openvpn@server
systemctl enable openvpn@server