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

variable provisioner_script {
  type = string
  description = "script to provision on remote ec2 instance"
  default = ""
}