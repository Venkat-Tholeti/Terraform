
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
  default = ["NANI", "VENKAT", "BOBBY", "NAIDU"]
}

variable "zone_id" {
  default = "Z01053453ISR026N9BIT1"
}

variable "domain_name" {
  default = "devopsaws.store"
}


variable "common_tags" {
  default = {
     Project = "roboshop"
     Terraform = "true"
  }
}


