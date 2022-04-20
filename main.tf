terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  #  변수를 여기서 정의 할 수 있음
  source                     = "./vpc"
  vpc_cidr_block             = "10.0.0.0/16"
  public-a_subnet_cidr_block = "10.0.4.0/24"
  public-c_subnet_cidr_block = "10.0.2.0/24"
  private1_subnet_cidr_block = "10.0.1.0/24"
  private2_subnet_cidr_block = "10.0.3.0/24"

}
module "db" {
  source                   = "./db"
  vpc_id                   = module.vpc.vpc_id
  aws_db_subnet_group_name = module.vpc.aws_db_subnet_group_name

}
module "autoscaling_group" {
  source = "./autoscaling"
  instance-sg = module.vpc.instance-sg
  vpc_id = module.vpc.vpc_id
  public_subnet_id-a = module.vpc.public_subnet_id-a
  public_subnet_id-c = module.vpc.public_subnet_id-c
  image_id =  "ami-0ed11f3863410c386"
}
