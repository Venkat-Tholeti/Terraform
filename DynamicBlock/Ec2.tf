# DYNAMIC BLOCK IS USED TO GENERATE REPEATED NESTED BLOCKS DYNAMICALLY USING LOOPS

# FOR EASY UNDERSTANDING OF LOOPS
# FOR VALUES REPEAT USE "FOR"
# FOR RESOURCE REPEAT USE "COUNT OR FOR_EACH"
# FOR NESTED BLOCK REPEATS USE "DYNAMIC"

resource "aws_instance" "roboshop" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.Devops.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "Devops" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ports

    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
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