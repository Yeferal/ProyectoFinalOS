#!/bin/bash

FICHERO=count-group.txt
count=0

if [ -f $FICHERO ]
then
   while IFS= read -r line
   do
	  count=$(($line + 1))
   done < count-group.txt
   echo $count | tee count-group.txt
else
   touch count-group.txt
   count=1000
   echo "1000" >> count-group.txt
fi 

read -p "Ingrese el nombre del grupo: " grupo;
read -p "Ingrese la unidad organizativa a la que pertenecera: " ou;
touch $grupo.ldif
echo "dn: cn=$grupo,ou=$ou,dc=proy-so,dc=com 
objectClass: top
objectClass: posixGroup
gidNumber: $count
cn: $grupo" >> $grupo.ldif

ldapadd -xcWD "cn=admin,dc=proy-so,dc=com" -f $grupo.ldif
echo "Grupo Agregado"
