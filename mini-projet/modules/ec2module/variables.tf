variable instancetype {
  type = string
  description = "set aws instance type"
  default = "t2.nano"
}

variable aws_common_tag {
  type = map
  description = "Set aws tag"
  default = {
    Name: "ec2-default"
  }
}

variable aws_kp_name {
  type = string
  description = "name of keys pairs created on aws"
}

variable pk_filepath {
  type = string
  description = "path of the private key corresponding to the keys pair created on aws"
}

variable sg_name {
  type = string
  description = "security group name"
  default = "default-sg"
}

variable provisioner_script {
  type = string
  description = "script to provision on remote ec2 instance"
  default = ""
}
