#!/bin/bash

read -p "Ingrese el nombre del usuario: " user;
touch $user.ldif
echo "dn: uid=$user,ou=People,dc=proy-so,dc=com
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: $user
uid: $user" >> $user.ldif

FICHERO=passwd.txt
pass=""

if [ -f $FICHERO ]
then
   rm passwd.txt
   touch passwd.txt 
else
   touch passwd.txt
fi 

slappasswd >> passwd.txt
#
#echo "$mypass" >> passwd.txt

while IFS= read -r line
   do
	  pass=$line
   done < passwd.txt

echo "userPassword: $pass
shadowLastChange: 17058
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/bash" >> $user.ldif

FICHERO=count-user.txt
count=0

if [ -f $FICHERO ]
then
   while IFS= read -r line
   do
	  count=$(($line + 1))
   done < count-user.txt
   echo $count | tee count-user.txt
else
   touch count-user.txt
   count=1000
   echo "1000" >> count-user.txt
fi 

echo "uidNumber: $count
gidNumber: $count
homeDirectory: /home/$user" >> $user.ldif

read -p "Password LDAP: " mypass;
ldapadd -f $user.ldif -D cn=admin,dc=proy-so,dc=com -w $mypass

ldappasswd -s $pass -W -D "cn=admin,dc=proy-so,dc=com" -x "uid=$user,ou=People,dc=proy-so,dc=com"
echo "Usuario Agregado"



