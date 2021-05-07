#Paso 2: Configurando el servidor LDAP

#se crea un valor hash para la contraseña dada, tome 
#nota de ello, lo usará en el archivo de configuración LDAP.
echo 'slappasswd';
slappasswd

#se ingresa una contrasenia y luego aparece la misma cifrada
#esta es cifrada en hash
echo 'debe tomar nota de la contraseña cifrada le servira mas adelante';
echo 'tiene un minuto para guardarla';
sleep 1m

#cree un archivo LDIF ( ldaprootpasswd.ldif ) que se usa para 
#agregar una entrada al directorio LDAP.
echo 'sudo vim ldaprootpasswd.ldif';
sudo vim ldaprootpasswd.ldif


#agregue la entrada LDAP correspondiente especificando el URI 
#que se refiere al servidor ldap y al archivo anterior.
echo 'sudo ldapadd -Y EXTERNAL -H ldapi:/// -f ldaprootpasswd.ldif';
sudo ldapadd -Y EXTERNAL -H ldapi:/// -f ldaprootpasswd.ldif

echo '\n===> FIN PASO 2 <===\n';

