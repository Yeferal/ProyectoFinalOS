#!/bin/bash

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

#echo "$mypass" >> passwd.txt

while IFS= read -r line
   do
	  pass=$line
   done < passwd.txt
   
echo "olcRootPW: $pass" >> db.ldif

ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif

ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif
