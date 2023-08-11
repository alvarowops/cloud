virginia_cidr = "10.10.0.0/16"


#public_subnet = "10.10.0.0/24"
#private_subnet = "10.10.1.0/24"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "prod"
  "owner"       = "Alvaro"
  "cloud"       = "AWS"
  "IAC"         = "terraform"
  "IAC_VERSION" = "1.5.4" 
  "project" = "Darts"
  "region" = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-0f9ce67dcf718d332"
  "instance_type" = "t2.micro"
}

ingress_ports_list = [ 22,80,443 ]

db_password = "Navarro-1311"