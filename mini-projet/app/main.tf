provider "aws" {
  region = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket = "terraform-state.dev.bnptraining-v1"
    key = "miniprojet.tfstate"
    region = "eu-west-3"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs             = var.vpc_azs
  public_subnets  = var.vpc_public_subnet
  private_subnets = var.vpc_private_subnet
  enable_nat_gateway = true
  enable_vpn_gateway = true
  tags = var.vpc_tag
}

module "ec2" {
    source = "../modules/ec2module"
    count = length(var.vpc_public_subnet)
    subnet_id = module.vpc.public_subnets[count.index]
    sg_id = module.securitygroup.id
    aws_kp_name = var.aws_kp_name
    pk_filepath = var.pk_filepath
    provisioner_script = var.ec2_provisioner_script
    instancetype = var.ec2_instance_type
    aws_common_tag = var.aws_common_tag
}

module "securitygroup" {
    source = "../modules/securitygroupmodule"
    vpc_id = module.vpc.vpc_id
    sg_name = var.security_group_name
}

module "ebs" {
  source = "../modules/ebsmodule"
  count = 3
  size = var.additional_ebs_size
  availability_zone = module.ec2[count.index].availability_zone
  instance_id = module.ec2[count.index].instance_id
  public_ip = module.ec2[count.index].public_ip
  pk_filepath = var.pk_filepath
  provisioner_script = var.ebs_provisioner_script
}

/*module "pubip" {
  source = "../modules/pubipmodule"
  count = 3
  instance_id = module.ec2[count.index].instance_id
}*/
