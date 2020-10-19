data "aws_caller_identity" "current" {
  
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = [data.aws_caller_identity.current.account_id]
  
  filter {
    name = "name"
    values = ["nginx-BASE-*"]
  } 
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = var.aws_kp_name
  subnet_id = var.subnet_id

  root_block_device {
    delete_on_termination = true
  }
  
  security_groups = [var.sg_id]
  tags = var.aws_common_tag
}
