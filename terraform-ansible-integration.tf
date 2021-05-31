provider "aws" {
region = "ap-south-1"
}


locals{
        ssh_user        = "ec2-user"
        key_name        = "dev"
        private_key_path = "/home/ec2-user/aws-keys/dev.pem"
}




resource "aws_instance""web"{

ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
key_name = local.key_name

tags = {
Name = "webserver"
}

provisioner "local-exec" {
        command = "echo ${self.public_ip} >> public-ip.txt"
}
connection {
        type    = "ssh"
        host    = self.public_ip
        user    = "ec2-user"
        private_key = file("/home/ec2-user/aws-keys/dev.pem")
}


provisioner "file" {
        source  = "public-ip.txt"
        //content = "hello world"
        destination ="/home/ec2-user/publicips.txt"
}
}


