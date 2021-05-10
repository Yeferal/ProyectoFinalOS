#!/bin/bash

read -p "Ingrese el nombre de la unidad organizativa: " ou;
touch $ou.ldif
echo "dn: ou=$ou,dc=proy-so,dc=com
objectClass: top
objectClass: organizationalUnit
ou: $ou" >> $ou.ldif
read -p "Password LDAP: " mypass;
ldapadd -f $ou.ldif -D cn=admin,dc=proy-so,dc=com -w $mypass
echo "Unidad Organizativa Agregada"
