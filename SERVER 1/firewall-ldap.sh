#Agregue el servicio LDAPS al firewall (TCP 686).
echo 'firewall-cmd --permanent --add-service=ldaps';
firewall-cmd --permanent --add-service=ldaps
echo 'firewall-cmd --reload';
firewall-cmd --reload