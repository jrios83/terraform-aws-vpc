provider "aws" {
  region    = "sa-east-1"
  profile   = "terracoder"
}

module "my_vpc" {
  source        = "../modules/vpc"
  vpc_cidr      = "192.168.0.0/16"
  tenacy        = "default"
  vpc_id        = "${module.my_vpc.vpc_id}" #Calling the output from networking.tf
  subnet_cidr   = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = 1
  ami_id        = "ami-037c192f0fa52a358"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}" #Calling the output from networking.tf too
} 