echo 'yum update && yum install openldap openldap-clients nss-pam-ldapd'; 
yum update && yum install openldap openldap-clients nss-pam-ldapd


echo 'authconfig --enableldap --enableldapauth --ldapserver=ldap.example.com --ldapbasedn="dc=example,dc=com" --enablemkhomedir --update';
authconfig --enableldap --enableldapauth --ldapserver=ldap.example.com --ldapbasedn="dc=example,dc=com" --enablemkhomedir --update

#
echo 'getent passwd yefer';
getent passwd yefer

