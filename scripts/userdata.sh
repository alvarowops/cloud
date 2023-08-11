#!/bin/bash

# Actualizar el sistema
yum update -y

# Instalar el servidor web Apache
yum install -y httpd

# Iniciar y habilitar Apache
systemctl start httpd
systemctl enable httpd

# Instalar PHP y las bibliotecas necesarias
yum install -y php php-mysqlnd

# Reiniciar Apache para reconocer PHP
systemctl restart httpd

# Instalar el cliente MySQL
yum install -y mysql

# Descargar WordPress
cd /var/www/html
wget https://wordpress.org/latest.tar.gz

# Descomprimir WordPress
tar -xzf latest.tar.gz
cp -R wordpress/* /var/www/html/

# Configurar permisos
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/

# Limpiar archivos innecesarios
rm -rf wordpress
rm -f latest.tar.gz

# Crear el archivo de configuración de WordPress
cp wp-config-sample.php wp-config.php


# sed -i "s/'DB_NAME', 'database_name_here'/'DB_NAME', 'tu_nombre_de_base_de_datos'/g" wp-config.php
# sed -i "s/'DB_USER', 'username_here'/'DB_USER', 'tu_usuario_de_base_de_datos'/g" wp-config.php
# sed -i "s/'DB_PASSWORD', 'password_here'/'DB_PASSWORD', 'tu_contraseña_de_base_de_datos'/g" wp-config.php

# Finalmente, reiniciar Apache una vez más
systemctl restart httpd
