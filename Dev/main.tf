provider "aws" {
  region = "${var.aws_region}"
}
module "my_vpc" {
  source = "../modules/vpc"
  vpc_cidr = "192.168.0.0/16"
  tenancy = "default"
  vpc_id = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}


module "my_ec2" {
  source = "../modules/ec2"
  ec2_count = 10
  ami_id = "ami-041d6256ed0f2061c"
  instance_type = "t2.micro"
  subnet_id = "${module.my_vpc.subnet_id}"
}
