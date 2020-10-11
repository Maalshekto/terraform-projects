variable aws_kp_name {
  type = string
  description = "name of keys pairs created on aws"
  default = "devops-thomas"
}

variable pk_filepath {
  type = string
  description = "path of the private key corresponding to the keys pair created on aws"
  default = "./devops-thomas.pem"
}

variable ec2_provisioner_script {
  type = string
  description = "path of script to provision at the end of ec2 creation"
  default = "deploy_nginx.sh"
}

variable ec2_instance_type {
  type = string
  description = "ec2 instance type"
  default = "t2.nano"
}

variable ebs_provisioner_script {
  type = string
  description = "path of script to provision at the end of ebs creation"
  default = "mount_ebs.sh"
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