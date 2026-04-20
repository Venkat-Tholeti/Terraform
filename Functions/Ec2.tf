
resource "aws_instance" "Test" {
   count = length(var.instances)  
   ami = var.ami_id
   instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
   vpc_security_group_ids = [ aws_security_group.Test.id ]
   
   tags = merge(
       var.common_tags,
       {
          Component = var.instances[count.index]
          Name = var.instances[count.index]
       }
   )
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

      tags = merge(
        var.common_tags,
        {
          Name = "Testing"
        }
      )
}