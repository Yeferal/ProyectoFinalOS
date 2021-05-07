# instalar paquete necesario
echo 'sudo yum install wget';
sudo yum install wget

echo 'sudo wget http://www.vpn.net/installers/logmein-hamachi-2.1.0.203-1.x86_64.rpm';
sudo wget http://www.vpn.net/installers/logmein-hamachi-2.1.0.203-1.x86_64.rpm 

echo 'sudo yum install logmein-hamachi-2.1.0.203-1.x86_64.rpm';
sudo yum install logmein-hamachi-2.1.0.203-1.x86_64.rpm	

echo 'sudo hamachi login';
sudo hamachi login

#colocamos nuestro correo con el que nos registramos
read -p "Nombre del Cliente: " nombrecliente;
echo 'sudo hamachi set-nick '$nombrecliente;
sudo hamachi set-nick $nombrecliente

# correo de registro
read -p "Ingrese su correo electronico LogMeIn: " email;
sudo hamachi attach $email
	
#unirse al link del server
sudo hamachi join 451-410-513
