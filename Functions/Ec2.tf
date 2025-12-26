#IN  TERRAFORM WE CANNOT USE OWR OWN FUNCTIONS, INSTEAD WE NEED TO USE BUILTIN FUNCTIONS
#FUNCTION WILL TAKE INPUT AND GIVES DESIRED OUTPUT



resource "aws_instance" "roboshop" {
    count = length(var.instances) # LENGTH FUNCTION
    ami = var.ami_id
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small" # expression ? "this value if true" : "this will run if false"
    vpc_security_group_ids = [ aws_security_group.Devops.id ]

    tags = merge(
       var.common_tags,  # Merge Function merge(common_tags, variable tags)
       {
        component = var.instances[count.index]
        Name = var.instances[count.index] #FOR DIIFERENT NAMES FOR INSTANCES CREATED, OTHERWISE IT WILL CREATE INSTANCES WITH SAME NAME.
       }
    )
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

   tags = merge(
    var.common_tags,
    {
      Name = "Terraform Test"
    }
  )
}