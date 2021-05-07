#Paso 3: Configurando la base de datos LDAP

#Ahora copie el archivo de configuración de la base de datos 
#de muestra para slapd en el directorio /var/lib/ldap , y 
#establezca los permisos correctos en el archivo .
echo 'sudo cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG';
sudo cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
echo 'sudo chown -R ldap:ldap /var/lib/ldap/DB_CONFIG';
sudo chown -R ldap:ldap /var/lib/ldap/DB_CONFIG 
echo 'sudo systemctl restart slapd';
sudo systemctl restart slapd

#importe algunos esquemas LDAP básicos del 
#directorio /etc/openldap/schema
echo 'sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif'; 
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
echo 'sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif';
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif
echo 'sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif';
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif

#Ahora agregue su dominio a la base de datos LDAP y cree un 
#archivo llamado ldapdomain.ldif para su dominio.
echo 'sudo vim ldapdomain.ldif ';
sudo vim ldapdomain.ldif 

#agregue la configuración anterior a la base de datos LDAP con el siguiente comando.
echo 'sudo ldapmodify -Y EXTERNAL -H ldapi:/// -f ldapdomain.ldif';
sudo ldapmodify -Y EXTERNAL -H ldapi:/// -f ldapdomain.ldif

#En este paso, debemos agregar algunas entradas a nuestro 
#directorio LDAP . Cree otro archivo llamado baseldapdomain.ldif 
echo 'sudo vim baseldapdomain.ldif';
sudo vim baseldapdomain.ldif

#agregue las entradas al directorio LDAP.
echo 'sudo ldapadd -Y EXTERNAL -x -D cn=Manager,dc=example,dc=com -W -f baseldapdomain.ldif';
sudo ldapadd -Y EXTERNAL -x -D cn=Manager,dc=example,dc=com -W -f baseldapdomain.ldif

#crear un usuario LDAP para ejemplo , tecmint y 
#configurar una contraseña para este usuario
read -p "Ingrese el nombre de Usuario: " usuario;
echo 'sudo useradd '$usuario;
read -p "Ingrese la contraseña para el usuario: " contrasenia;
sudo passwd $contrasenia

#cree las definiciones para un grupo LDAP en un archivo llamado ldapgroup.ldif
echo 'sudo vim ldapgroup.ldif';
sudo vim ldapgroup.ldif

echo 'sudo ldapadd -Y EXTERNAL -x  -W -D "cn=Manager,dc=example,dc=com" -f ldapgroup.ldif';
sudo ldapadd -Y EXTERNAL -x  -W -D "cn=Manager,dc=example,dc=com" -f ldapgroup.ldif

#cree otro archivo LDIF llamado ldapuser.ldif y 
#agregue las definiciones para el usuario creado
#debe agregar su contrasenia cifrada
echo 'sudo vim ldapuser.ldif';
sudo vim ldapuser.ldif

#cargue la configuración en el directorio LDAP.
echo 'ldapadd -Y EXTERNAL  -x -D cn=Manager,dc=example,dc=com -W -f  ldapuser.ldif';
ldapadd -Y EXTERNAL  -x -D cn=Manager,dc=example,dc=com -W -f  ldapuser.ldif

echo '\n===> FIN PASO 3 <===\n';