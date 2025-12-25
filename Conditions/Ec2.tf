resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small" # expression ? "this value if true" : "this will run if false"
    vpc_security_group_ids = [ aws_security_group.Devops.id ]

    tags = var.ec2_tags
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