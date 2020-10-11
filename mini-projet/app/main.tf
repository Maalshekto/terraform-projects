provider "aws" {
  region     = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-thomas"
    key = "miniprojet.tfstate"
    region     = "us-east-2"
  }
}

module "ec2" {
    source = "../modules/ec2module"

    sg_name = module.securitygroup.name
    aws_kp_name = var.aws_kp_name
    pk_filepath = var.pk_filepath
    provisioner_script = var.ec2_provisioner_script
    instancetype = var.ec2_instance_type
    aws_common_tag = var.aws_common_tag
}

module "securitygroup" {
    source = "../modules/securitygroupmodule"

    sg_name = var.security_group_name
}

module "ebs" {
  source = "../modules/ebsmodule"

  size = var.additional_ebs_size
  availability_zone = module.ec2.availability_zone
  instance_id = module.ec2.instance_id
  public_ip = module.pubip.public_ip
  pk_filepath = var.pk_filepath
  provisioner_script = var.ebs_provisioner_script
}

module "pubip" {
  source = "../modules/pubipmodule"

  instance_id = module.ec2.instance_id
}
