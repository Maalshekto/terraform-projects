variable instancetype {
  type = string
  description = "set aws instance type"
  default = "t2.nano"
}

variable sg_name {
  type = string
  description = "security group name"
  default = "thomas-sg"
}

variable vpc_id {
  type = string
  description = "VPC ID"
}

variable aws_common_tag {
  type = map
  description = "Set aws tag"
  default = {
    Name: "ec2-thomas"
  }
}
