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