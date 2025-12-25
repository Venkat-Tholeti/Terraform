# loops
# ===================
# 1. count based loops # you can write count of resources you require under the resource definition
# 2. for loops 
    # If we have list go for "count"
    # If we have map or set go for "for_each"
# 3. dynamic block



resource "aws_instance" "roboshop" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value
    vpc_security_group_ids = [ aws_security_group.Devops.id ]

    tags = {
        Name = each.key
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