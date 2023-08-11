#!/bin/bash

# Actualizaciones y pre-requisitos
yum update -y

# Instalar Apache
yum install -y httpd

# Habilitar e iniciar Apache
systemctl enable httpd
systemctl start httpd

# Instalar PHP 7.4 y extensiones necesarias
amazon-linux-extras enable php7.4
yum clean metadata
yum install -y php-cli php-fpm php-json php-common php-mysqlnd php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath

# Descargar y descomprimir WordPress
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
cp -R wordpress/* /var/www/html/

# Establecer permisos
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/

# Configurar WordPress para usar la base de datos RDS
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/'DB_NAME', 'database_name_here'/'DB_NAME', 'wordpressdb'/g" /var/www/html/wp-config.php
sed -i "s/'DB_USER', 'username_here'/'DB_USER', 'alvarodarts'/g" /var/www/html/wp-config.php
sed -i "s/'DB_PASSWORD', 'password_here'/'DB_PASSWORD', 'Navarro-1311'/g" /var/www/html/wp-config.php
sed -i "s/'DB_HOST', 'localhost'/'DB_HOST', '${rds_endpoint}'/g" /var/www/html/wp-config.php

# Reiniciar Apache para que los cambios surtan efecto
systemctl restart httpd
