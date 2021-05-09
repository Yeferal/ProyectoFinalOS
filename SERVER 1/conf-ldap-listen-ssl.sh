echo "#SLAPD_URLS="ldapi:/// ldap:/// ldaps:///"" >> /etc/sysconfig/slapd
echo 'nano /etc/sysconfig/slapd';
nano /etc/sysconfig/slapd

echo 'systemctl restart slapd';
systemctl restart slapd
echo 'netstat -antup | grep -i 636';
netstat -antup | grep -i 636