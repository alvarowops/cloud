variable "subnets" {
  description = "lista de subnets"
  type        = list(string)
}
variable "tags" {
  description = "Tags"
  type        = map(string)

}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type = string
}
variable "ec2_specs" {
  description = "parametros de la instancia"
  type = map(string)
}
variable "ingress_ports_list" {
  description = "Lista de puertos de ingress"
  type = list(number)
}

variable "access_key" {}

variable "secret_key" {}

variable "db_password" {
  description = "Password for the RDS instance"
  sensitive   = true
}
 variable "virginia_cidr" {
  description = "CIDR block for the VPC in Virginia"
  type        = string
}

