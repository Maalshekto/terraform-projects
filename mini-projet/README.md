# Mini-project

The scripts deploy :
* an EC2 instance
* a security group 
* an Elastic Public IP
* an additional ECB volume (with attachment to the EC2 instance)

It is assumed that you have provided AWS credentials using "**aws configure**".

There is 2 files to customize before using :
* **app/variables** : mainly **aws_kp_name** & **pk_filepath** (Other values can be leave as default if wanted)
* **app/main.tf** : The terraform backend in S3 can be removed (keep it locally) or modify to reflect your own S3 bucket.
