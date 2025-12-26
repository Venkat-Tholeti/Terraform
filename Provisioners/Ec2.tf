resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.Devops.id ]

    tags = var.ec2_tags

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > inventory" 
        on_failure = continue # Continue further in apply process eventhough provisioner fails(Otherwise whole terraform build will fail)
    }

    provisioner "local-exec" {
        command = "echo 'Instance is destroyed'" 
        when = destroy 
    }

                    #FOR REMOTE EXEC
    connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    password    = "DevOps321" 
  }

   provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
    ]
 }
 
   provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
 }

}

resource "aws_security_group" "Devops" {
    name = var.sg_name
    description = var.sg_description


    ingress {
     from_port        = var.from_port
     to_port          = var.to_port
     protocol         = "-1"
     cidr_blocks      = var.cidr_blocks
     ipv6_cidr_blocks = ["::/0"]
    }
 
   egress {
     from_port        = var.from_port
     to_port          = var.to_port
     protocol         = "-1"
     cidr_blocks      = var.cidr_blocks
     ipv6_cidr_blocks = ["::/0"]
  }

   tags = var.sg_tags
}