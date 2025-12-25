# loops
# ===================
# 1. count based loops # you can write count of resources you require under the resource definition
# 2. for loops
# 3. dynamic block



resource "aws_instance" "roboshop" {
    count = 4 # Count based loop, 4 instances will be created in one go
    ami = var.ami_id
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small" # expression ? "this value if true" : "this will run if false"
    vpc_security_group_ids = [ aws_security_group.Devops.id ]

    tags = {
        Name = var.instances[count.index] #FOR DIIFERENT NAMES FOR INSTANCES CREATED, OTHERWISE IT WILL CREATE INSTANCES WITH SAME NAME.
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