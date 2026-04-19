
resource "aws_instance" "Test" {
   count = 4 #Count based loop, here it will create 4 ec2 instances  
   ami = var.ami_id
   instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
   vpc_security_group_ids = [ aws_security_group.Test.id ]
   
   tags = {
    Name = var.instances[count.index] #index starts from 0, so now it will create mongodb instance 1st and rest of them in loop 
   } # if we are not giving above count.index it will create 4 instances with same name, to avoid taht we have declared a variable with list we need  and choose count.index
}

resource "aws_security_group" "Test" {
      name = var.sg_name
      description = var.sg_description

      ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_block
        ipv6_cidr_blocks = ["::/0"]
      }
      
      egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_block
        ipv6_cidr_blocks = ["::/0"]
      }

      tags = var.sg_tags
}