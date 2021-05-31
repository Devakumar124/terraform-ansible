provider "aws" {
region = "ap-south-1"
}


locals{
        ssh_user        = "ec2-user"
        key_name        = "dev"


}

resource "aws_instance""web"{

ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
key_name = local.key_name

tags = {
Name = "webserver"
}


provisioner "remote-exec"{
        inline = ["echo 'wait until SSH is ready'"]

        connection {
        type    = "ssh"
        user    = local.ssh_user
        private_key = file("dev.pem")
        host    = aws_instance.web.public_ip
}
}


provisioner "local-exec" {
command = "ansible-playbook -i ${aws_instance.web.public_ip}, --private-key ${"dev.pem"} httpd.yml"
}
}
