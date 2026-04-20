
variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "AMI ID of JoinDevops"
}

variable "instance_size" {
  default = "t3.micro"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "Testing"
    Project = "Terraform"
  }
}

variable "sg_name" {
  default = "Test"
}

variable "sg_description" {
  default = "Terraform practice"
}

variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "cidr_block" {
  type    = list(any)
  default = ["0.0.0.0/0"]

}

variable "ingress_ports" {
  default = [ #list(map)
    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },
    {
      from_port = 443
      to_port   = 443
    }
  ]
}


variable "sg_tags" {
  default = {
    Name    = "Testing"
    Project = "Terraform"
  }
}

variable "environment" {
  default = "dev"
}

variable "instances" {
  default = {
    mongodb  = "t3.micro" # "each" keyword is assigned for every iteration, so you will get each.key and each.value
    redis    = "t3.micro"
    mysql    = "t3.small"
    rabbitmq = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z04803303VFTPZATMTQ6X"
}

variable "domain_name" {
  default = "devopsaws.store"
}