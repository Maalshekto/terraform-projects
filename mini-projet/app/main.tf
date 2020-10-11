provider "aws" {
  region     = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "YOUR-TERRAFORM-BACKEND"
    key = "miniprojet.tfstate"
    region     = "us-east-2"
  }
}

module "ec2" {
    source = "../modules/ec2module"
    sg_name = module.securitygroup.name
    aws_kp_name = "YOUR_AWS_KEYS_PAIR_NAME"
    pk_filepath = "PATH/OF/YOUR/PRIVATE/KEY.pem"
    provisioner_script = "deploy_nginx.sh"
    instancetype = "t2.nano"
    aws_common_tag = {
      Name = "ec2-dev-miniprojet"
    }
}

module "securitygroup" {
    source = "../modules/securitygroupmodule"
    sg_name = "sg_miniprojet"
}

module "ebs" {
  source = "../modules/ebsmodule"
  size = 5
  availability_zone = module.ec2.availability_zone
  instance_id = module.ec2.instance_id
  public_ip = module.pubip.public_ip
  pk_filepath = "PATH/OF/YOUR/PRIVATE/KEY.pem"
  provisioner_script = "mount_ecb.sh"
}

module "pubip" {
  source = "../modules/pubipmodule"
  instance_id = module.ec2.instance_id
}

