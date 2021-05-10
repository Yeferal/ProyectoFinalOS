#!/bin/bash

echo " " >> /etc/hosts
read -p "Ingrese la ip del servidor: " ipServidor;
read -p "Ingrese la ip del cliente: " ipCliente;

echo "
$ipServidor server.proy-so.com server
$ipCliente client.proy-so.com client" >> /etc/hosts

#Install the following LDAP RPM packages on LDAP server
echo 'yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel';
yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel

echo 'systemctl start slapd';
systemctl start slapd

echo 'systemctl enable slapd';
systemctl enable slapd

echo 'netstat -antup | grep -i 389';
netstat -antup | grep -i 389
