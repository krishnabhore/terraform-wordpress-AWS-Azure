provider "aws"  {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_instance" "os1245" {
ami = "ami-010aff33ed5991201"
instance_type="t2.micro"
security_groups = [ "ayush" ]
key_name = "OS_test"
tags={
Name="My First OS Done 1"
}
}

resource "null_resource" "Resource_Items" {


  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("C:/Users/raja/Downloads/OS_test.pem")
    host = aws_instance.os1245.public_ip
  }

  provisioner "remote-exec" {
  


    inline = [
      "sudo yum install docker -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl start docker",
      "sudo docker pull wordpress",
      "sudo docker run --name wp -p 8080:80 -d wordpress"
      

    ]
        

  }
  
}




output "ip_ins" {
  value = "IP : ${aws_instance.os1245.public_ip}"
  
}
