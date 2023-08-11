
# Grupo de subredes para RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = lower("rds-subnet-group-${local.sufix}")
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]

tags = {
  Name = lower("rds-subnet-group-${local.sufix}")
}

}

# Grupo de seguridad para RDS
resource "aws_security_group" "sg_rds" {
  name        = "RDS SG"
  description = "Allow MySQL inbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

ingress {
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  security_groups = [aws_security_group.sg_public_instance.id]
}


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS SG-${local.sufix}"
  }
}

# Instancia de base de datos RDS
resource "aws_db_instance" "wordpress_db" {
  allocated_storage    = 20 # Tamaño mínimo para MySQL
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro" # Tipo de instancia para la capa gratuita
  db_name              = "wordpressdb"

  username             = "alvarodarts"
  password             = var.db_password # Cambia esto a una contraseña segura
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_rds.id]

  tags = {
    Name = "WordPressDatabase${local.sufix}"
  }
}



