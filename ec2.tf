variable "instancias" {
  description = "Nombre de las instancias"
  type = list(string)
  default = [ "wordpress" ]
}
resource "aws_instance" "wordpress-ec2" {

  for_each = toset(var.instancias)
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data = templatefile("${path.module}/userdata.tpl", {
  rds_endpoint = aws_db_instance.wordpress_db.endpoint
})


  tags = {
    "Name" =  "${each.value}-${local.sufix}"
  }
}
