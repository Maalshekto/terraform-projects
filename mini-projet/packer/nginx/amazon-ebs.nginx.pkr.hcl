source "amazon-ebs" "nginx" {
      ami_description= "Unbuntu Nginx AMI"
      ami_name       = "nginx-BASE-v${var.BUILD_NUMBER}-{{timestamp}}-AMI"
      ami_users      = var.ami_users
      ami_virtualization_type    = "hvm"
      associate_public_ip_address= var.associate_public_ip_address
      instance_type  = var.instance_type
      region         = var.region
      run_tags = {
        Name= "amazon-ubuntu-packer"
        Application= "Nginx"
      }
      spot_price  = "auto"
      ssh_username= "ubuntu"
      ssh_interface= var.ssh_interface

      subnet_id=var.subnet_id

      source_ami_filter {
        filters = {
          virtualization-type= "hvm"
          name= "ubuntu-bionic-*"
          root-device-type= "ebs"
        }
        most_recent= true
        owners= ["amazon"]
      }

      temporary_key_pair_name= "amazon-packer-{{timestamp}}"

      vpc_id=var.vpc_id

      tags = { 
        OS_Version  = "Amazon 2 linux"
        Version     = var.BUILD_NUMBER
        Application = "Nginx Image"
        Runner      = "EC2"
        Name = "Nginx"
      }
    }
