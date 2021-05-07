#actualiza los paquetes del sistema
echo 'sudo dnf update';
sudo dnf update 

#dependencias y herramientas de compilación necesarias para una compilación y compilación exitosa de OpenLDAP
echo 'dnf install cyrus-sasl-devel make libtool autoconf libtool-ltdl-devel openssl-devel libdb-devel tar gcc perl perl-devel wget vim';
dnf install cyrus-sasl-devel make libtool autoconf libtool-ltdl-devel openssl-devel libdb-devel tar gcc perl perl-devel wget vim

#Crear cuenta del sistema OpenLDAP
echo 'useradd -r -M -d /var/lib/openldap -u 55 -s /usr/sbin/nologin ldap';
useradd -r -M -d /var/lib/openldap -u 55 -s /usr/sbin/nologin ldap

#Descargar OpenLDAP Source Tarball
echo 'VER=2.4.48';
VER='2.4.48'

echo 'wget ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-'$VER'.tgz';
wget ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-$VER.tgz

#Extraiga el código fuente de OpenLDAP Tarball
echo 'tar xzf openldap-'$VER'.tgz';
tar xzf openldap-$VER.tgz

#compiamos el archivo de compilacion
#cp compiLDAP.sh openldap-2.4.48

#Compilar OpenLDAP
#accedemos a la carpeta para compilar
echo 'cd openldap-'$VER;
cd openldap-$VER

echo 'Listo';
