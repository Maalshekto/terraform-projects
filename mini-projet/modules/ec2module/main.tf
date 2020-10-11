data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]
  
  filter {
    name = "name"
    values = ["ubuntu-bionic-*"]
  } 
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instancetype
  key_name      = "devops-thomas"

  provisioner "remote-exec" { 
      script = var.provisioner_script

      connection {
        type = "ssh"
        agent = false
        user = "ubuntu"
        private_key = file("./devops-thomas.pem")
        host = aws_instance.myec2.public_ip
      }
  }

  root_block_device {
    delete_on_termination = true
  }
  

  security_groups = [var.sg_name]
  tags = var.aws_common_tag
}