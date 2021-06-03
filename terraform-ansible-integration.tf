provider "aws" {
region = "ap-south-1"
}

resource "aws_instance""web"{

ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
key_name = "demo-tcs-key"

tags = {
Name = "deleted"
}
provisioner "local-exec" {
command = "echo ${self.public_ip} ansible-user=ec2-user > public-ip"
}
}
        
