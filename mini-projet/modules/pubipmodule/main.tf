resource "aws_eip" "lb" {
  vpc = true
  instance = var.instance_id

  provisioner "local-exec" {
    command = "echo \"PUBLIC IP: ${aws_eip.lb.public_ip}\" > ip_ec2.txt"
  }
  
}