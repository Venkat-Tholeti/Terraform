
resource "aws_instance" "Test" {
   ami = var.ami_id
   instance_type = var.instance_size
   vpc_security_group_ids = [ aws_security_group.Test.id ]
   
   tags = var.ec2_tags
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