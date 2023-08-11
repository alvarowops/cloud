
# IP pública de la instancia EC2
output "ec2_public_ip" {
  description = "Ip publica de la instancia"
  value       = aws_instance.wordpress-ec2["wordpress"].public_ip
}

# Endpoint de la base de datos RDS
output "rds_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = aws_db_instance.wordpress_db.endpoint
}

# ARN de la base de datos RDS (útil para algunas configuraciones)
output "rds_arn" {
  description = "ARN de la base de datos RDS"
  value       = aws_db_instance.wordpress_db.arn
}

# Nombre del grupo de seguridad de RDS
output "rds_security_group_name" {
  description = "Nombre del grupo de seguridad de RDS"
  value       = aws_security_group.sg_rds.name
}
