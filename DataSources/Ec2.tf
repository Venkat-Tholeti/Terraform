
resource "aws_instance" "Test" {
   ami = data.aws_ami.joindevops.id
   instance_type = "t3.micro"
   vpc_security_group_ids = [ aws_security_group.Test.id ]
   
   tags = {
     Name = "Testing"
     Project = "Terraform"
   }
}

resource "aws_security_group" "Test" {
      name = "Test_group"
      description = "Practice concept"

      ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
      
      egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }

      tags = {
            Name = "Testing"
            Project = "Terraform"
      }
}