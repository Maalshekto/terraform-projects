resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = var.availability_zone
  size              = var.size
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id = aws_ebs_volume.ebs_vol.id
  instance_id = var.instance_id
  force_detach = true
  
  provisioner "remote-exec" { 
      script = var.provisioner_script

      connection {
        type = "ssh"
        agent = false
        user = "ubuntu"
        private_key = file(var.pk_filepath)
        host = var.public_ip
      }
  }
}
