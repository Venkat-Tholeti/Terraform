# Conditions
# ==================
#IN GENERAL
# if(expression){
# 	these statements if expression is true
# }
# else{
# 	these statements if expression is false
# }

#IN TERRAFORM
# expression ? "this value if true" : "this will run if false"



variable "ami_id" {
  description = "AMI ID OF JOINDEVOPS"
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  description = "DEFAULT INSTANCE TYPE"
  type        = string
  default     = "t2.micro"
}

variable "ec2_tags" {
  type = map(string) # map of string or map
  default = {
    Name = "PRACTICE"
    Purpose = "PROJECT"
  }
}

variable "sg_name" {
  default = "DEVOPS PRACTICE"
}

variable "sg_description" {
  default = "ALLOW ALL PORTS"
}

variable "from_port" {
  type = number
  default = 0
}

variable "to_port" {
  type = number
  default = 0
}

variable "cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "sg_tags" {
    default = {
      Name = "Terraform Test"
    }
}

variable "environment" {
  default = "prod"
}


variable "instances" {
  default = {  # we are giving below like this, because we need to use map here
     mongodb = "t3.micro" # "each" keyword is assigned for every iteration, so we will get each.key & each.value
     redis   =  "t3.micro"
     mysql   =  "t3.small"
  }
}

variable "zone_id" {
  default = "Z01053453ISR026N9BIT1"
}

variable "domain_name" {
  default = "devopsaws.store"
}