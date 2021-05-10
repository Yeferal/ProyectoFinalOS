echo "local4.*	/var/log/ldap.log" >> /etc/rsyslog.conf
systemctl restart rsyslog
