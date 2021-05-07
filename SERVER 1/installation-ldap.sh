#Paso 1: Instalar el servidor LDAP

#instalacion en caso de pedir contrasenia agreguela
echo 'sudo yum install openldap openldap-servers';
sudo yum install openldap openldap-servers 

#en centos 7: los siguientes comandos son para iniciar el
#daemon del servidor openldap , habilítelo para que se inicie 
#automáticamente en el momento del arranque y verifique si está 
#en funcionamiento

echo 'sudo systemctl start slapd';
sudo systemctl start slapd
echo 'sudo systemctl enable slapd';
sudo systemctl enable slapd
echo 'sudo systemctl status slapd';
sudo systemctl status slapd

#permita las solicitudes al demonio del servidor LDAP a través del firewall
echo 'firewall-cmd --add-service=ldap';
firewall-cmd --add-service=ldap

echo '\n===> FIN PASO 1 <===\n';
