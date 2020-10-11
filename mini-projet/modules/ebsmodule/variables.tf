variable availability_zone {
  type = string
  description = "availability zone"
}

variable size {
  type = number
  description = "size of ebs in Go"
  default = 8
}

variable instance_id {
  type = string
  description = "instance_id"
}

variable public_ip {
  type = string
  description = "public_ip"
}

variable pk_filepath {
  type = string
  description = "path of the private key corresponding to the keys pair created on aws"
}

variable provisioner_script {
  type = string
  description = "script to provision on remote ec2 instance"
  default = ""
}
