#!/bin/bash

yum install -y openldap-clients nss-pam-ldapd net-tools

read -p "Ingrese la direccion del servidor: " ip;
authconfig --enableldap --enableldapauth --ldapserver=$ip --ldapbasedn="dc=proy-so,dc=com" --enablemkhomedir --update
echo "Configurado Autentifiacion ..."
systemctl restart  nslcd
