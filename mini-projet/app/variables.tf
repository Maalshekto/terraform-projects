# VPC Configurations : 
variable vpc_azs {
  type = string
  description = "name of selected azs for VPC"
  default = "eu-west-3a"
}

variable vpc_name {
  type = string
  description = "name of VPC"
  default = "bnptraining-vpc"
}

variable vpc_cidr {
  type = string
  description = "cidr of VPC"
  default = "10.2.0.0/16"
}

variable vpc_subnet {
  type = string
  description = "subnet of VPC"
  default = "10.2.1.0/24"
}

variable vpc_tag {
  type = map
  description = "Set vpc tag"
  default = {
    Terraform = "true"
    Environment = "dev"
  }
}
 
# Other configurations :

variable aws_kp_name {
  type = string
  description = "name of keys pairs created on aws"
  default = "YOUR_AWS_KEYS_PAIR_NAME"
}

variable pk_filepath {
  type = string
  description = "path of the private key corresponding to the keys pair created on aws"
  default = "PATH/OF/YOUR/PRIVATE/KEY.pem"
}

variable ec2_provisioner_script {
  type = string
  description = "path of script to provision at the end of ec2 creation"
  default = "./scripts/deploy_nginx.sh"
}

variable ec2_instance_type {
  type = string
  description = "ec2 instance type"
  default = "t2.nano"
}

variable ebs_provisioner_script {
  type = string
  description = "path of script to provision at the end of ebs creation"
  default = "./scripts/mount_ebs.sh"
}

variable additional_ebs_size {
  type = number
  description = "size of additional EBS volume"
  default = 5
}

variable security_group_name {
  type = string
  description = "Name of security group"
  default = "sg_miniprojet"
}

variable aws_common_tag {
  type = map
  description = "Set aws tag"
  default = {
      Name = "ec2-dev-miniprojet"
  }
}
