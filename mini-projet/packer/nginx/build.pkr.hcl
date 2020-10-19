build {
sources=[
  "source.amazon-ebs.nginx"
  ]

  provisioner "shell" {
     scripts=[
       "./deploy_nginx.sh"
       ]
    }
}
