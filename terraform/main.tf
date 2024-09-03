terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

#   region               = "us-east-1"
  vpc_cidr             = "11.0.0.0/16"
  public_subnet_cidrs  = ["11.0.1.0/24", "11.0.2.0/24","11.0.3.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b","us-east-1c"]
  project_name         = "try"
}

module "sg" {
    source = "./modules/sg"
    depends_on = [ module.vpc ]
    vpc_id = module.vpc.vpc_id
    project_name         = "try"  
}

module "ec2" {
    source = "./modules/ec2"
    depends_on = [ module.vpc , module.sg ]
    sg_id = module.sg.sg_id
    subnet_id = module.vpc.public_subnet_ids
    availability_zones = module.vpc.availability_zones
    project_name = "try" 
  
}

module "alb" {
    source = "./modules/alb"
    depends_on = [ module.ec2 ]
    vpc_id = module.vpc.vpc_id
    subnet_id = module.vpc.public_subnet_ids
    sg_id = module.sg.sg_id
    ec2 = module.ec2.ec2_id
    project_name = "try"
}